using Microsoft.Extensions.Logging;
using CryptoTracker.App.Services;
using CryptoTracker.sdk;
using CryptoTracker.Sdk.Clients.CoinGecko;
using CryptoTracker.sdk.Clients.InMemory;
using CryptoTracker.sdk.Interfaces;


namespace CryptoTracker.App;

public static class MauiProgram
{
    public static MauiApp CreateMauiApp()
    {
        var builder = MauiApp.CreateBuilder();
        builder
            .UseMauiApp<App>()
            .ConfigureFonts(fonts => { fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular"); });

        builder.Services.AddMauiBlazorWebView();

#if DEBUG
        builder.Services.AddBlazorWebViewDeveloperTools();
        builder.Logging.AddDebug();
#endif
        builder.Services.AddHttpClient<ICryptoMarketClient, CoinGeckoMarketClient>(client =>
        {
            client.BaseAddress = new Uri("https://api.coingecko.com/api/v3/");
        });
        
        builder.Services.AddSingleton<IPortfolioStore, FilePortfolioStore>();
        
        // 🔹 SDK registrations
        builder.Services.AddSingleton<IPortfolioClient, InMemoryPortfolioClient>();
        builder.Services.AddSingleton<IAlertsClient, InMemoryAlertsClient>();
        builder.Services.AddSingleton<CryptoTrackerClient>();

        return builder.Build();
    }
}