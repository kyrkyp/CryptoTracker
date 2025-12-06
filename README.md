# 🚀 CryptoTracker

### Cross-platform .NET 8 MAUI Blazor crypto portfolio & market tracker powered by a clean, extensible SDK.

![GitHub repo
size](https://img.shields.io/github/repo-size/kyrkyp/CryptoTracker)
![GitHub
license](https://img.shields.io/github/license/kyrkyp/CryptoTracker)
![GitHub
stars](https://img.shields.io/github/stars/kyrkyp/CryptoTracker?style=social)
![.NET](https://img.shields.io/badge/.NET-8.0-purple)
![MAUI](https://img.shields.io/badge/MAUI-Blazor-blue)
![Platforms](https://img.shields.io/badge/Platforms-Windows%20%7C%20Android-green)

------------------------------------------------------------------------

## 📌 Overview

CryptoTracker is a cross-platform cryptocurrency tracking application
built with:

-   .NET 8\
-   MAUI Blazor Hybrid UI\
-   A modular SDK (CryptoTracker.Sdk)\
-   Local persistence using JSON\
-   Fake market provider (for development)\
-   Plug-and-play architecture for real market APIs (CoinGecko, Binance)

------------------------------------------------------------------------

## ✨ Features

### 📊 Portfolio Tracking

-   Manage holdings
-   Automatic evaluation using (fake/real) market data
-   PnL + PnL% calculation

### 👁️ Watchlist

-   Live market polling
-   Auto refresh every few seconds
-   Color-coded changes

### 💾 Persistence

Stored as JSON under AppDataDirectory.

### 🧩 SDK Architecture

Includes: ICryptoMarketClient, IPortfolioClient, IAlertsClient,
IPortfolioStore.

------------------------------------------------------------------------

## 🏛️ Architecture Overview

    CryptoTracker/
    │
    ├── CryptoTracker.Sdk/
    │     ├── Models/
    │     ├── Interfaces/
    │     ├── Clients/
    │     │      └── InMemory/
    │     └── CryptoTrackerClient.cs
    │
    ├── CryptoTracker.App/
    │     ├── Pages/
    │     ├── Components/
    │     ├── Services/
    │     ├── Platforms/
    │     └── MauiProgram.cs
    │
    └── README.md

------------------------------------------------------------------------

## 🧪 Getting Started

### Requirements

    dotnet workload install maui

### Clone the repo

    git clone https://github.com/kyrkyp/CryptoTracker.git
    cd CryptoTracker

### Run on Windows

Run CryptoTracker.App in Rider or Visual Studio.

### Run on Android

    dotnet workload install maui-android

------------------------------------------------------------------------

## 🖼️ Screenshots

Place screenshots into docs/ folder: - docs/portfolio.png\
- docs/watchlist.png

------------------------------------------------------------------------

## 🗺️ Roadmap

-   Real CoinGecko provider\
-   Candlestick charts\
-   Alerts\
-   Cloud sync\
-   Multi-portfolio support

------------------------------------------------------------------------

## 🤝 Contributing

PRs are welcome.

## 📄 License

MIT License.
