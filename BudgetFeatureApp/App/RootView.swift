import SwiftUI
import BudgetFeature

struct RootView: View {
    private let container: AppDependencyContainer

    init(container: AppDependencyContainer) {
        self.container = container
    }

    var body: some View {
        if container.isBudgetEnabled {
            BudgetFeatureEntry.makeRootView(
                configuration: container.makeBudgetConfiguration()
            )
        } else {
            FeatureDisabledView()
        }
    }
}

private struct FeatureDisabledView: View {
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "lock.fill")
                .font(.system(size: 32))
                .foregroundStyle(.secondary)

            Text(NSLocalizedString("app.budget.feature.disable", comment: ""))
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}
