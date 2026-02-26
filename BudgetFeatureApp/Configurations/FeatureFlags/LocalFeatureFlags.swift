import Foundation

public protocol FeatureFlagProviding {
    var isBudgetEnabled: Bool { get }
}

public struct LocalFeatureFlags: FeatureFlagProviding {
    public let isBudgetEnabled: Bool

    public init(isBudgetEnabled: Bool) {
        self.isBudgetEnabled = isBudgetEnabled
    }
}
