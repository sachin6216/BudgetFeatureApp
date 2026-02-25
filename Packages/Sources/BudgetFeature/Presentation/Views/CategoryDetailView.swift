import SwiftUI

struct CategoryDetailView: View {

    var body: some View {
        List {
            Section {
                spendingRow(
                    title: "Spent",
                    amount: "$200",
                    tint: .red
                )
                spendingRow(
                    title: "Remaining",
                    amount: "$100",
                    tint: .green
                )
            }

            Section("Transactions") {
                ForEach(0..<5) { _ in
                    TransactionRowView()
                }
            }
        }
        .navigationTitle("Food")
    }

    // MARK: - Private

    private func spendingRow(title: String, amount: String, tint: Color) -> some View {
        HStack {
            Text(title)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            Spacer()
            Text(amount)
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(tint)
        }
    }
}
