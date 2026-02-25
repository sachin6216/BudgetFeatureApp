import Foundation

public struct BudgetCategory: Equatable, Identifiable {
    public let id: String
    public let name: String
    public let icon: String
    public let total: Decimal
    public let spent: Decimal
    public let transactions: [Transaction]
    
    public init(id: String, name: String, icon: String, total: Decimal, spent: Decimal, transactions: [Transaction]) {
        self.id = id
        self.name = name
        self.icon = icon
        self.total = total
        self.spent = spent
        self.transactions = transactions
    }
    
    public var progress: Double {
        guard total > 0 else { return 0 }
        let ratio = NSDecimalNumber(decimal: spent).doubleValue /
                    NSDecimalNumber(decimal: total).doubleValue
        return min(max(ratio, 0), 1)
    }
}
