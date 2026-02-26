import SwiftUI

struct CategoryRowView: View {
    let model: CategoryRowModel

    var body: some View {
        VStack(alignment: .leading, spacing: BudgetStyle.Spacing.md) {
            HStack(spacing: BudgetStyle.Spacing.lg - 2) {
                Image(systemName: model.icon)
                    .frame(
                        width: BudgetStyle.Size.categoryIconFrame,
                        height: BudgetStyle.Size.categoryIconFrame
                    )
                    .foregroundStyle(.white)
                    .background(
                        .tint,
                        in: RoundedRectangle(
                            cornerRadius: BudgetStyle.Shape.categoryIconCornerRadius,
                            style: .continuous
                        )
                    )

                VStack(alignment: .leading, spacing: BudgetStyle.Spacing.xxs) {
                    Text(model.name)
                        .font(BudgetStyle.Font.subheadlineMedium)
                        .foregroundStyle(.primary)

                    Text("\(model.spentLabel) \(model.ofLabel) \(model.totalLabel)")
                        .font(BudgetStyle.Font.caption)
                        .foregroundStyle(.secondary)
                }

                Spacer()

                Text(model.amountLabel)
                    .font(BudgetStyle.Font.subheadlineSemibold)
            }
            .accessibilityHidden(true)

            BudgetProgressBar(progress: model.progress)
        }
        .padding(.vertical, BudgetStyle.Spacing.xs)
        .accessibilityLabel(Text("define"))
    }
}
