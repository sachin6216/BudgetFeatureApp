import Foundation

protocol FeatureFlagProviding {
    var isBudgetEnabled: Bool { get }
}

struct LocalFeatureFlags: FeatureFlagProviding {
    let isBudgetEnabled: Bool

    init(isBudgetEnabled: Bool) {
        self.isBudgetEnabled = isBudgetEnabled
    }
}
