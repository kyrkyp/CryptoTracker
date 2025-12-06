namespace CryptoTracker.sdk.Models;

public record Holding(
    string Symbol,
    decimal Amount,
    decimal AvgBuyPrice
    );