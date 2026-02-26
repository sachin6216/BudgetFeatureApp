# BudgetFeatureApp

Demo host app for the `BudgetFeature` Swift Package. Shows how to wire the package into a real app with feature flags, dependency injection, and proper configuration at the composition root.

## Structure

```
BudgetFeatureApp/
├── App/
│   ├── BudgetFeatureApp.swift          # @main — creates AppDependencyContainer once
│   └── RootView.swift                  # Feature-flag gate → routes to BudgetFeature or disabled screen
├── Configurations/
│   |── FeatureFlags/
│   |   └── LocalFeatureFlags.swift     # Providing Local Feature Flags
|   └── AppDependencyContainer.swift     # Composition root — builds all feature configurations
└── Resources/
    └── Localizable.strings      
```

## How configuration flows

```
BudgetFeatureApp (@main)
  └── AppDependencyContainer          ← created once, lives for the process lifetime
        └── makeBudgetConfiguration() ← called by RootView, returns BudgetConfiguration
              └── BudgetFeatureEntry.makeRootView(configuration:)
```

The app never reaches into `BudgetFeature` internals. The contract is `BudgetConfiguration` in, a SwiftUI view out.

## Feature flags

Flags are read from `FeatureFlags.plist` in the main bundle. Add a Boolean key `isBudgetEnabled` to control whether the budget screen is shown. If the plist is missing the flag defaults to `true`, so the feature is always visible in debug builds.

To test with the feature disabled, either set the plist key to `NO` or use `StubFeatureFlagProvider` in a preview:

```swift
RootView(
    container: AppDependencyContainer(
        featureFlagProvider: StubFeatureFlagProvider(isBudgetEnabled: false)
    )
)
```

## Requirements

- iOS 16+
- Xcode 15+
