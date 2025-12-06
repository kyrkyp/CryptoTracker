using CryptoTracker.sdk.Interfaces;

namespace CryptoTracker.sdk;

public class CryptoTrackerClient(
    ICryptoMarketClient market,
    IPortfolioClient portfolio,
    IAlertsClient alerts)
{
    public ICryptoMarketClient Market { get; } = market;

    public IPortfolioClient Portfolio { get; } = portfolio;

    public IAlertsClient  Alerts { get; } = alerts;
}