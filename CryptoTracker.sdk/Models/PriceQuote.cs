namespace CryptoTracker.sdk.Models;

public record PriceQuote(
    string Symbol,
    decimal Price,
    decimal Change24HPercent,
    DateTimeOffset Timestamp
);
