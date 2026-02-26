import SwiftUI

struct TransactionRowView: View {
    let model: TransactionRowModel

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: BudgetStyle.Spacing.xxs) {
                Text(model.title)
                    .font(BudgetStyle.Font.subheadline)

                Text(model.dateText)
                    .font(BudgetStyle.Font.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Text(model.amountLabel)
                .font(BudgetStyle.Font.subheadlineMedium)
                .foregroundStyle(.primary)
        }
        .padding(.vertical, BudgetStyle.Spacing.xxs)
    }
}
