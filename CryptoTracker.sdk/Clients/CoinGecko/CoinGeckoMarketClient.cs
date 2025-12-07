using System.Net.Http.Json;
using System.Text.Json;
using CryptoTracker.sdk.Interfaces;
using CryptoTracker.sdk.Models;

namespace CryptoTracker.Sdk.Clients.CoinGecko;

public class CoinGeckoMarketClient : ICryptoMarketClient
{
    private readonly HttpClient _http;
    private readonly JsonSerializerOptions _jsonOptions = new()
    {
        PropertyNameCaseInsensitive = true
    };

    // dynamic symbol -> id map (btc -> bitcoin, usdt -> tether, κλπ)
    private readonly Dictionary<string, string> _symbolToId =
        new(StringComparer.OrdinalIgnoreCase);

    // TODO: βάλε το από secrets/config, όχι hard-coded στο repo
    private const string DemoApiKey = "CG-CrFDVJ8kC3peKzqPjk5opZAn";

    public CoinGeckoMarketClient(HttpClient http)
    {
        _http = http;

        if (_http.BaseAddress is null)
        {
            _http.BaseAddress = new Uri("https://api.coingecko.com/api/v3/");
        }

        if (!_http.DefaultRequestHeaders.Contains("x-cg-demo-api-key"))
        {
            _http.DefaultRequestHeaders.Add("x-cg-demo-api-key", DemoApiKey);
        }
    }

    // --------------------------------------------------------------------
    //  Top coins
    // --------------------------------------------------------------------
    public async Task<IReadOnlyList<CoinInfo>> GetTopCoinsAsync(
        int limit = 50,
        CancellationToken ct = default)
    {
        var perPage = Math.Clamp(limit, 1, 250);

        var url =
            $"coins/markets?vs_currency=usd&order=market_cap_desc&per_page={perPage}&page=1&sparkline=false";

        var response = await _http.GetAsync(url, ct);
        response.EnsureSuccessStatusCode();

        var items = await response.Content.ReadFromJsonAsync<List<CoinGeckoMarketItem>>(
            _jsonOptions,
            ct);

        if (items == null)
        {
            return Array.Empty<CoinInfo>();
        }
        
        foreach (var item in items)
        {
            if (!string.IsNullOrWhiteSpace(item.Symbol) &&
                !string.IsNullOrWhiteSpace(item.Id))
            {
                _symbolToId[item.Symbol] = item.Id;
            }
        }

        var result = items
            .Select(i => new CoinInfo(
                Symbol: i.Symbol,
                Name: i.Name,
                IconUrl: i.Image ?? string.Empty))
            .ToList();

        return result;
    }

    // --------------------------------------------------------------------
    //  Current price
    // --------------------------------------------------------------------
    public async Task<PriceQuote> GetPriceAsync(
        string symbol,
        string vsCurrency = "usd",
        CancellationToken ct = default)
    {
        if (string.IsNullOrWhiteSpace(symbol))
            throw new ArgumentException("Symbol is required", nameof(symbol));

        var id = await ResolveIdAsync(symbol, ct);

        var url =
            $"simple/price?ids={Uri.EscapeDataString(id)}&vs_currencies={vsCurrency}&include_24hr_change=true";

        var response = await _http.GetAsync(url, ct);
        response.EnsureSuccessStatusCode();

        using var stream = await response.Content.ReadAsStreamAsync(ct);
        using var doc = await JsonDocument.ParseAsync(stream, cancellationToken: ct);

        if (!doc.RootElement.TryGetProperty(id, out var coinElement))
        {
            return new PriceQuote(
                Symbol: symbol,
                Price: 0m,
                Change24HPercent: 0m,
                Timestamp: DateTimeOffset.UtcNow);
        }

        var pricePropName = vsCurrency.ToLowerInvariant();
        if (!coinElement.TryGetProperty(pricePropName, out var priceElement))
            throw new InvalidOperationException($"No '{pricePropName}' price in response for '{id}'.");

        var price = priceElement.GetDecimal();

        decimal change24h = 0;
        if (coinElement.TryGetProperty($"{pricePropName}_24h_change", out var changeElement))
        {
            change24h = changeElement.GetDecimal();
        }

        return new PriceQuote(
            Symbol: symbol,
            Price: price,
            Change24HPercent: change24h,
            Timestamp: DateTimeOffset.UtcNow);
    }

    // --------------------------------------------------------------------
    //  Historical prices (για sparklines κλπ)
    // --------------------------------------------------------------------
    public async Task<IReadOnlyList<Candle>> GetHistoricalPricesAsync(
        string symbol,
        string vsCurrency,
        string timeFrame,
        CancellationToken ct = default)
    {
        var id = await ResolveIdAsync(symbol, ct);
        
        var url =
            $"coins/{Uri.EscapeDataString(id)}/market_chart?vs_currency={vsCurrency}&days=1&interval=hourly";

        var response = await _http.GetAsync(url, ct);
        response.EnsureSuccessStatusCode();

        var data = await response.Content.ReadFromJsonAsync<CoinGeckoMarketChartResponse>(
            _jsonOptions,
            ct);

        if (data?.Prices == null || data.Prices.Count == 0)
            return Array.Empty<Candle>();

        var candles = data.Prices
            .Select(p =>
            {
                var tsMs = p[0];
                var price = p[1];

                var ts = DateTimeOffset.FromUnixTimeMilliseconds((long)tsMs);
                var val = (decimal)price;
                
                return new Candle(
                    Timestamp: ts,
                    Open: val,
                    High: val,
                    Low: val,
                    Close: val,
                    Volume: 0m);
            })
            .ToList();

        return candles;
    }

    // --------------------------------------------------------------------
    //  Dynamic symbol -> id mapping
    // --------------------------------------------------------------------
    private async Task<string> ResolveIdAsync(string symbol, CancellationToken ct)
    {
        await EnsureSymbolMapLoadedAsync(ct);

        if (_symbolToId.TryGetValue(symbol, out var id))
            return id;
        
        return symbol.ToLowerInvariant();
    }

    private async Task EnsureSymbolMapLoadedAsync(CancellationToken ct)
    {
        if (_symbolToId.Count > 0)
            return;

        var response = await _http.GetAsync("coins/list", ct);
        response.EnsureSuccessStatusCode();

        var coins = await response.Content.ReadFromJsonAsync<List<CoinGeckoCoinListItem>>(
            _jsonOptions, ct);

        if (coins is null)
            return;

        foreach (var coin in coins)
        {
            if (!string.IsNullOrWhiteSpace(coin.Symbol) &&
                !string.IsNullOrWhiteSpace(coin.Id))
            {
                _symbolToId[coin.Symbol] = coin.Id;
            }
        }
    }

    // --------------------------------------------------------------------
    //  Internal DTOs
    // --------------------------------------------------------------------
    private sealed class CoinGeckoCoinListItem
    {
        public string Id { get; set; } = string.Empty;
        public string Symbol { get; set; } = string.Empty;
        public string Name { get; set; } = string.Empty;
    }

    private sealed class CoinGeckoMarketItem
    {
        public string Id { get; set; } = string.Empty;
        public string Symbol { get; set; } = string.Empty;
        public string Name { get; set; } = string.Empty;
        public string? Image { get; set; }
        public decimal Current_Price { get; set; }
        public decimal? Price_Change_Percentage_24h { get; set; }
    }

    private sealed class CoinGeckoMarketChartResponse
    {
        public List<List<double>> Prices { get; set; } = new();
    }
}
