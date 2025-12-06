namespace CryptoTracker.sdk.Models;

public record HoldingPosition(
    Holding Holding,
    decimal CurrentPrice,
    decimal CurrentValue,
    decimal PnL,
    decimal PnLPercent
    );