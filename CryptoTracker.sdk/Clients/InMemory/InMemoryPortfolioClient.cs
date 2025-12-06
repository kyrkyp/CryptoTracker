using CryptoTracker.sdk.Interfaces;
using CryptoTracker.sdk.Models;

namespace CryptoTracker.sdk.Clients.InMemory;

public class InMemoryPortfolioClient : IPortfolioClient
{
    public InMemoryPortfolioClient(
        ICryptoMarketClient marketClient,
        IPortfolioStore store)
    {
        _marketClient = marketClient;
        _store = store;
    }
    
    #region DI

    private readonly Dictionary<string, Holding> _holdings = new(StringComparer.OrdinalIgnoreCase);
    private readonly ICryptoMarketClient  _marketClient;
    private readonly IPortfolioStore _store;
    private bool _loaded;

    #endregion

    public async Task<PortfolioSnapshot> GetSnapshotAsync(
        CancellationToken ct = default)
    {
        await EnsureLoadedAsync(ct);

        var positions = new List<HoldingPosition>();

        foreach (var holding in _holdings.Values)
        {
            var quote = await _marketClient.GetPriceAsync(
                holding.Symbol,
                "usd",
                ct);

            var currentPrice = quote.Price;
            var currentValue = holding.Amount * currentPrice;
            var invested = holding.Amount * holding.AvgBuyPrice;
            var pnl = currentValue - invested;
            var pnlPercent = invested == 0
                ? 0m
                : pnl / invested * 100m;

            positions.Add(new HoldingPosition(
                Holding: holding,
                CurrentPrice: currentPrice,
                CurrentValue: currentValue,
                PnL: pnl,
                PnLPercent: decimal.Round(pnlPercent, 2)
            ));
        }

        var totalInvested = positions.Sum(p => p.Holding.Amount * p.Holding.AvgBuyPrice);
        var totalCurrent = positions.Sum(p => p.CurrentValue);
        var totalPnL = totalCurrent - totalInvested;
        var totalPnLPercent = totalInvested == 0
            ? 0m
            : totalPnL / totalInvested * 100m;

        return new PortfolioSnapshot(
            Positions: positions,
            TotalCurrentValue: decimal.Round(totalCurrent, 2),
            TotalInvested: decimal.Round(totalInvested, 2),
            TotalPnL: decimal.Round(totalPnL, 2),
            TotalPnLPercent: decimal.Round(totalPnLPercent, 2));
    }

    public async Task AddOrUpdateHoldingAsync(
        string symbol,
        decimal amount,
        decimal buyPrice,
        CancellationToken ct = default)
    {
        if (string.IsNullOrWhiteSpace(symbol))
            return;

        await EnsureLoadedAsync(ct);

        symbol = symbol.Trim();

        if (_holdings.TryGetValue(symbol, out var existing))
        {
            var totalAmount = existing.Amount + amount;
            if (totalAmount <= 0)
            {
                _holdings.Remove(symbol);
            }
            else
            {
                var totalCost = existing.Amount * existing.AvgBuyPrice + amount * buyPrice;
                var newAvgPrice = totalCost / totalAmount;

                _holdings[symbol] = existing with
                {
                    Amount = totalAmount,
                    AvgBuyPrice = newAvgPrice
                };
            }
        }
        else
        {
            if (amount > 0)
            {
                _holdings[symbol] = new Holding(symbol, amount, buyPrice);
            }
        }

        await PersistAsync(ct);
    }

    public async Task RemoveHoldingAsync(
        string symbol,
        CancellationToken ct = default)
    {
        if (string.IsNullOrWhiteSpace(symbol))
            return;

        await EnsureLoadedAsync(ct);

        symbol = symbol.Trim();
        _holdings.Remove(symbol);

        await PersistAsync(ct);
    }

    #region Helpers

    private async Task EnsureLoadedAsync(CancellationToken ct)
    {
        if (_loaded) return;

        var holdings = await _store.LoadAsync(ct);

        _holdings.Clear();
        foreach (var holding in holdings)
        {
            if (!string.IsNullOrWhiteSpace(holding.Symbol))
            {
                _holdings[holding.Symbol] = holding;
            }
        }

        _loaded = true;
    }

    private Task PersistAsync(CancellationToken ct)
    {
        IReadOnlyList<Holding> snapshot = _holdings.Values.ToList();
        return _store.SaveAsync(snapshot, ct);
    }

    #endregion
}