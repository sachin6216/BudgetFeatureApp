import Foundation

struct CategoryDetailModelFactory {
    private let strings: BudgetStringsProvider
    private let formatter: CurrencyFormatter

    init(strings: BudgetStringsProvider, formatter: CurrencyFormatter) {
        self.strings = strings
        self.formatter = formatter
    }

    func make(for category: BudgetCategory) -> CategoryDetailModel {
        let remaining = category.total - category.spent
        return CategoryDetailModel(
            name: category.name,
            spentLabel: strings.detailSpent,
            remainingLabel: strings.detailRemaining,
            spentAmount: formatter.format(category.spent),
            remainingAmount: formatter.format(remaining),
            progress: category.progress,
            progressHeader: strings.detailProgressHeader,
            transactionsHeader: strings.detailTransactionsHeader,
            noTransactionsMessage: strings.detailNoTransactions,
            transactions: category.transactions.map { makeTransactionRow(for: $0) }
        )
    }

    // MARK: - Private

    private func makeTransactionRow(for transaction: Transaction) -> TransactionRowModel {
        TransactionRowModel(
            id: transaction.id,
            title: transaction.title,
            dateText: transaction.date.formatted(date: .abbreviated, time: .omitted),
            amountLabel: "−\(formatter.format(transaction.amount))"
        )
    }
}
