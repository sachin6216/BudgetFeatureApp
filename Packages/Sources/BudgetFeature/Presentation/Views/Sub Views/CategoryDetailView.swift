import SwiftUI

struct CategoryDetailView: View {
    let category: BudgetCategory

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

            Section(category.name) {
                ForEach(category.transactions) { transaction in
                    TransactionRowView()
                }
            }
        }
        .navigationTitle(category.name)
    }

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
