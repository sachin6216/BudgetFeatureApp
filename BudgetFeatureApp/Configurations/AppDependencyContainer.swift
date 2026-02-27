import Foundation
import BudgetFeature

final class AppDependencyContainer {
    private let featureFlagProvider: FeatureFlagProviding

    init(featureFlagProvider: FeatureFlagProviding = LocalFeatureFlags(isBudgetEnabled: true)) {
        self.featureFlagProvider = featureFlagProvider
    }

    func makeBudgetConfiguration() -> BudgetConfiguration {
        BudgetConfiguration(
            currencyFormatterConfiguration: CurrencyFormatterConfiguration(
                currencyCode: "EUR",
                minimumFractionDigits: 2,
                maximumFractionDigits: 2
            ),
            router: DefaultBudgetRouter(),
            stringsProvider: BudgetStringsProvider()
        )
    }

    var isBudgetEnabled: Bool {
        featureFlagProvider.isBudgetEnabled
    }
}
