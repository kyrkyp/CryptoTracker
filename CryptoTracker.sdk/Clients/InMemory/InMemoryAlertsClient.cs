using CryptoTracker.sdk.Interfaces;
using CryptoTracker.sdk.Models;

namespace CryptoTracker.sdk.Clients.InMemory;

public class InMemoryAlertsClient : IAlertsClient
{
    private readonly List<PriceAlert> _alerts = new();
    
    public Task<IReadOnlyList<PriceAlert>> GetAlertsAsync(CancellationToken ct = default)
    {
        IReadOnlyList<PriceAlert> copy = _alerts.ToList();
        
        return Task.FromResult(copy);
    }

    public Task AddAlertAsync(PriceAlert alert, CancellationToken ct = default)
    {
        if (alert.Id == Guid.Empty)
        {
            alert = alert with { Id = Guid.NewGuid() };
        }
        
        _alerts.Add(alert);
        
        return Task.CompletedTask;
    }

    public Task RemoveAlertAsync(Guid alertId, CancellationToken ct = default)
    {
        _alerts.RemoveAll(a => a.Id == alertId);
        
        return Task.CompletedTask;
    }
}