# BudgetFeaturePackage

A Swift Package that displays a monthly budget overview. It's self-contained — the host app hands in a configuration struct and gets back a SwiftUI view. Nothing inside the package imports anything from the app.

## Integration

Add the package to your project via Xcode → File → Add Package Dependencies, then use the single entry point:

```swift
import BudgetFeature

let view = BudgetFeatureEntry.makeRootView(
    configuration: BudgetConfiguration(
        currencyFormatterConfiguration: CurrencyFormatterConfiguration(
            currencyCode: "EUR"
        )
    )
)
```

`BudgetConfiguration` has sensible defaults for everything, so the minimal call is just `BudgetConfiguration()`.


## Architecture

```
BudgetFeature/
├── Configuration/       # BudgetConfiguration + CurrencyFormatterConfiguration
├── Data/                # BudgetRepositoryImpl (simulated async fetch)
├── Domain/
│   ├── Models/          # Budget, BudgetCategory, Transaction, BudgetError
│   ├── Repository/      # BudgetRepository protocol
│   └── UseCases/        # LoadBudgetUseCase
|── Presentation/
|    ├── Router/          # BudgetRouter protocol, DefaultBudgetRouter, CategoryDetailModelFactory
|    ├── ViewModel/       # BudgetViewModel, display models for each sub-view
|    └── Views/           # BudgetView + sub-views
└── Resources/            # BudgetStringsProvider, BudgetStyle, CurrencyFormatter, Localizable and String+Extension

```

The router maps `BudgetDestination` cases to views. It receives a `BudgetRouterContext` (formatter config + strings) rather than the `BudgetViewModel`, keeping navigation logic independent of business logic. If you want to intercept navigation — for example to show the category detail inside a bottom sheet — implement `BudgetRouter` and pass it in via `BudgetConfiguration`.

