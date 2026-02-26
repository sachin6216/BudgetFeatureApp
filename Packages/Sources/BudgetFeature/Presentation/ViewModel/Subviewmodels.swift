import Foundation

public struct BudgetSummaryModel: Equatable {
    public let spentLabel: String
    public let totalLabel: String
    public let remainingLabel: String
    public let progress: Double

    public let summarySpentPrefix: String
    public let summaryOfWord: String
    public let remainingSuffix: String
}

public struct CategoryRowModel: Identifiable, Equatable {
    public let id: String
    public let name: String
    public let icon: String
    public let spentLabel: String
    public let ofLabel: String
    public let totalLabel: String
    public let amountLabel: String
    public let progress: Double
    public let destination: BudgetDestination

    public static func == (lhs: CategoryRowModel, rhs: CategoryRowModel) -> Bool {
        lhs.id == rhs.id
    }
}

public struct CategoryDetailModel {
    public let name: String
    public let spentLabel: String
    public let remainingLabel: String
    public let spentAmount: String
    public let remainingAmount: String
    public let progress: Double
    public let progressHeader: String
    public let transactionsHeader: String
    public let noTransactionsMessage: String
    public let transactions: [TransactionRowModel]
}

public struct TransactionRowModel: Identifiable {
    public let id: String
    public let title: String
    public let dateText: String
    public let amountLabel: String
}

public struct BudgetErrorModel {
    public let title: String
    public let message: String
    public let retryLabel: String
}
