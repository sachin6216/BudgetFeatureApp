import SwiftUI

public struct BudgetOverviewView: View {

    public init() {
    }

    public var body: some View {
        NavigationStack {
            List {
                Section {
                    BudgetSummaryCardView()
                }

                Section("Spending categories") {
                    ForEach(0..<5) { category in
                        NavigationLink {
                            CategoryDetailView()
                        } label: {
                            CategoryRowView()
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
        }
        .navigationTitle("Monthly Budget")

    }
}
