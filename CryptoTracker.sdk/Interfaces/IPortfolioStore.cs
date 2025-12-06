using CryptoTracker.sdk.Models;

namespace CryptoTracker.sdk.Interfaces;

public interface IPortfolioStore
{
    Task<IReadOnlyList<Holding>> LoadAsync(
        CancellationToken ct = default);

    Task SaveAsync(
        IReadOnlyList<Holding> holdings,
        CancellationToken ct = default);
}