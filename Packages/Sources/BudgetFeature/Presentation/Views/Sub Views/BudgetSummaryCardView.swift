import SwiftUI

struct BudgetSummaryCard: View {
    let model: BudgetSummaryModel

    var body: some View {
        VStack(alignment: .leading, spacing: BudgetStyle.Spacing.lg) {
            Text(
                "\(model.summarySpentPrefix) \(model.spentLabel) \(model.summaryOfWord) \(model.totalLabel)"
            )
            .font(BudgetStyle.Font.summaryTitle)
            .foregroundStyle(.primary)

            BudgetProgressBar(progress: model.progress)

            Text("\(model.remainingLabel) \(model.remainingSuffix)")
                .font(BudgetStyle.Font.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding(.vertical, BudgetStyle.Spacing.xs)
    }
}
