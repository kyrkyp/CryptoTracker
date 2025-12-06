using CryptoTracker.sdk.Models;

namespace CryptoTracker.sdk.Interfaces;

public interface ICryptoMarketClient
{
    Task<IReadOnlyList<CoinInfo>> GetTopCoinsAsync(
        int  limit = 50,
        CancellationToken ct = default);

    Task<PriceQuote> GetPriceAsync(
        string symbol,
        string vsCurrency,
        CancellationToken ct = default);

    Task<IReadOnlyList<Candle>> GetHistoricalPricesAsync(
        string symbol,
        string vsCurrency,
        string timeFrame,
        CancellationToken ct = default);
}