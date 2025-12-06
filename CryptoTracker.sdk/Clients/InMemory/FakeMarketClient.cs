using CryptoTracker.sdk.Interfaces;
using CryptoTracker.sdk.Models;

namespace CryptoTracker.sdk.Clients.InMemory;

public class FakeMarketClient : ICryptoMarketClient
{
    private readonly Random _random = new();

    private readonly List<CoinInfo> _coins = new()
    {
        new CoinInfo("btc", "Bitcoin", "https://dummyicons.com/btc.png"),
        new CoinInfo("eth", "Ethereum", "https://dummyicons.com/eth.png"),
        new CoinInfo("sol", "Solana", "https://dummyicons.com/sol.png"),
        new CoinInfo("ada", "Cardano", "https://dummyicons.com/ada.png"),
        new CoinInfo("xrp", "XRP", "https://dummyicons.com/xrp.png")
    };

    public Task<IReadOnlyList<CoinInfo>> GetTopCoinsAsync(
        int limit = 50,
        CancellationToken ct = default)
    {
        var result = _coins.Take(limit).ToList();
        return Task.FromResult<IReadOnlyList<CoinInfo>>(result);
    }

    public Task<PriceQuote> GetPriceAsync(
        string symbol,
        string vsCurrency = "usd",
        CancellationToken ct = default)
    {
        // Fake τιμή
        var basePrice = symbol.ToLower() switch
        {
            "btc" => 65000m,
            "eth" => 3200m,
            "sol" => 180m,
            "ada" => 0.45m,
            "xrp" => 0.6m,
            _ => 100m
        };

        // μικρή τυχαία απόκλιση +/- 5%
        var factor = 1m + ((decimal)_random.NextDouble() - 0.5m) * 0.1m;
        var price = Math.Round(basePrice * factor, 2);
        var change = Math.Round(((decimal)_random.NextDouble() - 0.5m) * 10m, 2); // -5%..+5%

        var quote = new PriceQuote(
            Symbol: symbol,
            Price: price,
            Change24HPercent: change,
            Timestamp: DateTimeOffset.UtcNow);

        return Task.FromResult(quote);
    }

    public Task<IReadOnlyList<Candle>> GetHistoricalPricesAsync(
        string symbol,
        string vsCurrency,
        string timeFrame,
        CancellationToken ct = default)
    {
        var candles = new List<Candle>();
        var now = DateTimeOffset.UtcNow;

        decimal current = symbol.ToLower() switch
        {
            "btc" => 65000m,
            "eth" => 3200m,
            "sol" => 180m,
            "ada" => 0.45m,
            "xrp" => 0.6m,
            _ => 100m
        };

        // 50 fake candles
        for (int i = 0; i < 50; i++)
        {
            var ts = now.AddMinutes(-i * 30); // κάθε 30 λεπτά
            var open = current * (1m + (decimal)_random.NextDouble() * 0.02m);
            var close = current * (1m + (decimal)_random.NextDouble() * 0.02m);
            var high = Math.Max(open, close) * 1.01m;
            var low = Math.Min(open, close) * 0.99m;
            var volume = (decimal)_random.Next(10_000, 1_000_000);

            candles.Add(new Candle(ts, open, high, low, close, volume));
        }

        IReadOnlyList<Candle> ordered = candles.OrderBy(c => c.Timestamp).ToList();
        return Task.FromResult(ordered);
    }
}