import SwiftUI

struct BudgetErrorView: View {
    let model: BudgetErrorModel
    let onRetry: () -> Void

    var body: some View {
        VStack(spacing: BudgetStyle.Spacing.xxl) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: BudgetStyle.Size.errorIconSize))
                .foregroundStyle(.orange)

            VStack(spacing: BudgetStyle.Spacing.sm) {
                Text(model.title)
                    .font(BudgetStyle.Font.errorTitle)

                Text(model.message)
                    .font(BudgetStyle.Font.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }

            Button(model.retryLabel, action: onRetry)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
        }
        .padding(BudgetStyle.Spacing.xxxl)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
