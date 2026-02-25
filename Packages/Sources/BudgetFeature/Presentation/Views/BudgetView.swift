import SwiftUI

internal struct BudgetView: View {
    
    @StateObject private var viewModel: BudgetViewModel
    
    public init(viewModel: BudgetViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        NavigationStack {
            content
                .navigationTitle("Monthly Budget")
        }
        .task { await viewModel.load() }
    }
    
    // MARK: - State switching
    
    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .loading:
            ProgressView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        case .loaded(let budget):
            budgetList(budget)
            
        case .error:
            BudgetErrorView {
                Task { await viewModel.load() }
            }
        }
    }
        
    private func budgetList(_ budget: Budget) -> some View {
        List {
            Section {
                BudgetSummaryCardView()
            }
            
            Section("Spending categories") {
                ForEach(budget.categories) { category in
                    NavigationLink {
                        CategoryDetailView(category: category)
                    } label: {
                        CategoryRowView(category: category)
                    }
                }
            }
        }
        .listStyle(.insetGrouped)
    }
}
