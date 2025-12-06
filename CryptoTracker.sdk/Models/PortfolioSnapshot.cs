namespace CryptoTracker.sdk.Models;

public record PortfolioSnapshot(
    IReadOnlyList<HoldingPosition> Positions,
    decimal TotalCurrentValue,
    decimal TotalInvested,
    decimal TotalPnL,
    decimal TotalPnLPercent
    );