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

Feature flags are provided through the FeatureFlagProviding protocol and injected via AppDependencyContainer.
The default implementation uses LocalFeatureFlags, which allows you to configure flags directly in code:
public protocol FeatureFlagProviding {
    var isBudgetEnabled: Bool { get }
}

```
public struct LocalFeatureFlags: FeatureFlagProviding {
    public let isBudgetEnabled: Bool

    public init(isBudgetEnabled: Bool) {
        self.isBudgetEnabled = isBudgetEnabled
    }
}
```

## Requirements

- iOS 16+
- Xcode 15+
