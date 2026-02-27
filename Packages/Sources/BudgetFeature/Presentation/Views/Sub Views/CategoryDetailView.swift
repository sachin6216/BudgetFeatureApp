import SwiftUI

struct CategoryDetailView: View {
    let model: CategoryDetailModel

    var body: some View {
        List {
            Section(model.progressHeader) {
                VStack(alignment: .leading, spacing: BudgetStyle.Spacing.md) {
                    BudgetProgressBar(progress: model.progress)

                    HStack {
                        spendingRow(
                            title: model.spentLabel,
                            amount: model.spentAmount,
                            tint: .red
                        )
                        Spacer()
                        spendingRow(
                            title: model.remainingLabel,
                            amount: model.remainingAmount,
                            tint: .green
                        )
                    }
                }
                .padding(.vertical, BudgetStyle.Spacing.xs)
            }

            Section(model.transactionsHeader) {
                if model.transactions.isEmpty {
                    Text(model.noTransactionsMessage)
                        .font(BudgetStyle.Font.subheadline)
                        .foregroundStyle(.secondary)
                } else {
                    ForEach(model.transactions) { transaction in
                        TransactionRowView(model: transaction)
                    }
                }
            }
        }
        .navigationTitle(model.name)
    }

    private func spendingRow(title: String, amount: String, tint: Color) -> some View {
        VStack(alignment: .leading, spacing: BudgetStyle.Spacing.xxs) {
            Text(title)
                .font(BudgetStyle.Font.subheadline)
                .foregroundStyle(.secondary)

            Text(amount)
                .font(BudgetStyle.Font.subheadlineSemibold)
                .foregroundStyle(tint)
        }
    }
}
