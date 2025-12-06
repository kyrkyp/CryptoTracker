using CryptoTracker.sdk.Interfaces;
using CryptoTracker.sdk.Models;

namespace CryptoTracker.sdk.Clients.InMemory;

public class InMemoryPortfolioClient : IPortfolioClient
{
    public InMemoryPortfolioClient(ICryptoMarketClient marketClient)
    {
        _marketClient = marketClient;
    }
    
    #region DI

    private readonly Dictionary<string, Holding> _holdings = new(StringComparer.OrdinalIgnoreCase);
    private readonly ICryptoMarketClient  _marketClient;

    #endregion

    public async Task<PortfolioSnapshot> GetSnapshotAsync(CancellationToken ct = default)
    {
        var positions = new List<HoldingPosition>();

        foreach (var holding in _holdings.Values)
        {
            var quote = await _marketClient.GetPriceAsync(holding.Symbol, "usd", ct);

            var currentPrice = quote.Price;
            var currentValue = holding.Amount *  currentPrice;
            var invested = holding.Amount * holding.AvgBuyPrice;
            var pnl = currentValue - invested;
            var pnlPercent = invested == 0 ? 0m : pnl / invested * 100;
            
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

        var snapshot = new PortfolioSnapshot(
            Positions: positions,
            TotalCurrentValue: decimal.Round(totalCurrent, 2),
            TotalInvested: decimal.Round(totalInvested, 2),
            TotalPnL: decimal.Round(totalPnL, 2),
            TotalPnLPercent: decimal.Round(totalPnLPercent, 2));

        return snapshot;
    }

    public Task AddOrUpdateHoldingAsync(
        string symbol, 
        decimal amount, 
        decimal buyPrice, 
        CancellationToken ct = default)
    {
        if (string.IsNullOrWhiteSpace(symbol))
            return Task.CompletedTask;

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

        return Task.CompletedTask;
    }

    public Task RemoveHoldingAsync(string symbol, CancellationToken ct = default)
    {
        if (!string.IsNullOrWhiteSpace(symbol))
        {
            _holdings.Remove(symbol.Trim());
        }

        return Task.CompletedTask;
    }
}