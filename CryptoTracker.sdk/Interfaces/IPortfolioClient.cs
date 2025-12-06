using CryptoTracker.sdk.Models;

namespace CryptoTracker.sdk.Interfaces;

public interface IPortfolioClient
{
    Task<PortfolioSnapshot> GetSnapshotAsync(CancellationToken ct = default);
    
    Task AddOrUpdateHoldingAsync(
        string symbol, 
        decimal amount,
        decimal buyPrice,
        CancellationToken ct = default);

    Task RemoveHoldingAsync(
        string symbol,
        CancellationToken ct = default);
}