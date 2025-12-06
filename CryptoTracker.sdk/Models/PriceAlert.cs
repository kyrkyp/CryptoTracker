using CryptoTracker.sdk.Enums;

namespace CryptoTracker.sdk.Models;

public record PriceAlert(
    Guid Id,
    string Symbol,
    AlertType Type,
    decimal ThresholdValue,
    bool IsActive
    );