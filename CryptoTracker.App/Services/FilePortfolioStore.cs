using System.Text.Json;
using CryptoTracker.sdk.Interfaces;
using CryptoTracker.sdk.Models;

namespace CryptoTracker.App.Services;

public class FilePortfolioStore : IPortfolioStore
{
    public FilePortfolioStore()
    {
        _filePath = Path.Combine(
            FileSystem.AppDataDirectory,
            "portfolio.json");
    }
    
    private readonly JsonSerializerOptions _jsonOptions = new()
    {
        WriteIndented = true
    };

    #region Properties

    private readonly string _filePath;

    #endregion

    public async Task<IReadOnlyList<Holding>> LoadAsync(
        CancellationToken ct = default)
    {
        try
        {
            if (!File.Exists(_filePath))
            {
                return Array.Empty<Holding>();
            }

            await using var stream = File.OpenRead(_filePath);
            var holdings = await JsonSerializer.DeserializeAsync<List<Holding>>(
                stream,
                _jsonOptions,
                ct);

            return holdings ?? new List<Holding>();
        }
        catch
        {
            return Array.Empty<Holding>();
        }
    }

    public async Task SaveAsync(
        IReadOnlyList<Holding> holdings,
        CancellationToken ct = default)
    {
        var directory = Path.GetDirectoryName(_filePath);
        if (!string.IsNullOrEmpty(directory) && !Directory.Exists(directory))
        {
            Directory.CreateDirectory(directory);
        }

        await using var stream = File.Create(_filePath);
        await JsonSerializer.SerializeAsync(
            stream,
            holdings,
            _jsonOptions,
            ct);
    }
}