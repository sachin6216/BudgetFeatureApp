import SwiftUI

struct BudgetSummaryCardView: View {

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Spent $200 of $800")
                .font(.title3.weight(.semibold))
                .foregroundStyle(.primary)

            BudgetProgressBar(progress: 0.3)
        }
        .padding(.vertical, 4)
    }
}
