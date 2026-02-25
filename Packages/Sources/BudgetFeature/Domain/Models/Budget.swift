import Foundation

public struct Budget: Equatable {
    public let total: Decimal
    public let spent: Decimal
    public let categories: [BudgetCategory]

    public var progress: Double {
        guard total > 0 else { return 0 }
        let ratio = NSDecimalNumber(decimal: spent).doubleValue /
                    NSDecimalNumber(decimal: total).doubleValue
        return min(max(ratio, 0), 1)
    }

    public init(total: Decimal, spent: Decimal, categories: [BudgetCategory]) {
        self.total = total
        self.spent = spent
        self.categories = categories
    }
}
