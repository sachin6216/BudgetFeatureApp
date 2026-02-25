import SwiftUI

struct CategoryRowView: View {

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 10) {
                Image(systemName: "fork.knife")
                    .frame(width: 28, height: 28)
                    .foregroundStyle(.white)
                    .background(.tint, in: RoundedRectangle(cornerRadius: 7, style: .continuous))

                VStack(alignment: .leading, spacing: 2) {
                    Text("Food")
                        .font(.subheadline.weight(.medium))
                        .foregroundStyle(.primary)

                    Text("$200 of $400")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }

            BudgetProgressBar(progress: 0.4)
        }
        .padding(.vertical, 4)
    }
}
