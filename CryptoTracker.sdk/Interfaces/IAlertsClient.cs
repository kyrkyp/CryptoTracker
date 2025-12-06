using CryptoTracker.sdk.Models;

namespace CryptoTracker.sdk.Interfaces;

public interface IAlertsClient
{
    Task<IReadOnlyList<PriceAlert>> GetAlertsAsync(CancellationToken ct = default);
    
    Task AddAlertAsync(PriceAlert alert, CancellationToken ct = default);
    
    Task RemoveAlertAsync(Guid alertId, CancellationToken ct = default);
}