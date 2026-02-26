import SwiftUI

struct BudgetView: View {
    @StateObject private var viewModel: BudgetViewModel
    @ObservedObject private var navigationStack: BudgetNavigationStack

    init(viewModel: BudgetViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
        _navigationStack = ObservedObject(wrappedValue: viewModel.navigationStack)
    }

    var body: some View {
        NavigationStack(path: $navigationStack.path) {
            content
                .navigationTitle(viewModel.strings.overviewNavigationTitle)
                .navigationDestination(for: BudgetDestination.self) { destination in
                    viewModel.router.view(for: destination, context: viewModel.routerContext)
                }
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

        case .error(let error):
            BudgetErrorView(
                model: viewModel.makeErrorModel(for: error),
                onRetry: { Task { await viewModel.load() } }
            )
        }
    }

    private func budgetList(_ budget: Budget) -> some View {
        List {
            Section {
                BudgetSummaryCard(model: viewModel.makeSummaryModel(for: budget))
            }

            Section(viewModel.strings.overviewCategoriesHeader) {
                ForEach(viewModel.makeCategoryRowModels(for: budget)) { rowModel in
                    Button {
                        navigationStack.push(rowModel.destination)
                    } label: {
                        CategoryRowView(model: rowModel)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .listStyle(.insetGrouped)
    }
}
