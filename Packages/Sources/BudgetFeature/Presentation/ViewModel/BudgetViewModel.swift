import Combine
import Foundation

@MainActor
final class BudgetViewModel: ObservableObject {
    @Published public private(set) var state: BudgetViewState = .loading

    let routerContext: BudgetRouterContext
    let router: BudgetRouter
    let navigationStack: BudgetNavigationStack
    let strings: BudgetStringsProvider

    private let useCase: LoadBudgetUseCaseProtocol
    private let currencyFormatter: CurrencyFormatter

    init(
        useCase: LoadBudgetUseCaseProtocol,
        configuration: BudgetConfiguration,
        navigationStack: BudgetNavigationStack = BudgetNavigationStack()
    ) {
        self.useCase = useCase
        self.strings = configuration.stringsProvider
        self.router = configuration.router
        self.navigationStack = navigationStack
        self.currencyFormatter = CurrencyFormatter(
            configuration: configuration.currencyFormatterConfiguration
        )
        self.routerContext = BudgetRouterContext(
            currencyFormatterConfiguration: configuration.currencyFormatterConfiguration,
            strings: configuration.stringsProvider
        )
    }

    func load() async {
        state = .loading
        do {
            let budget = try await useCase.execute()
            state = .loaded(budget)
        } catch let error as BudgetError {
            state = .error(error)
        } catch {
            state = .error(.unknown)
        }
    }

    func makeSummaryModel(for budget: Budget) -> BudgetSummaryModel {
        let remaining = budget.total - budget.spent
        return BudgetSummaryModel(
            spentLabel: format(budget.spent),
            totalLabel: format(budget.total),
            remainingLabel: format(remaining),
            progress: budget.progress,
            summarySpentPrefix: strings.overviewSummarySpent,
            summaryOfWord: strings.overviewSummaryOf,
            remainingSuffix: strings.overviewRemaining
        )
    }

    func makeCategoryRowModels(for budget: Budget) -> [CategoryRowModel] {
        budget.categories.map { category in
            CategoryRowModel(
                id: category.id,
                name: category.name,
                icon: category.icon,
                spentLabel: format(category.spent),
                ofLabel: strings.categoryOf,
                totalLabel: format(category.total),
                amountLabel: format(category.spent),
                progress: category.progress,
                destination: .categoryDetail(category)
            )
        }
    }

    func makeErrorModel(for error: BudgetError) -> BudgetErrorModel {
        switch error {
        case .networkUnavailable:
            return BudgetErrorModel(
                title: strings.errorNetworkTitle,
                message: strings.errorNetworkMessage,
                retryLabel: strings.errorRetryButton
            )
        case .emptyResponse:
            return BudgetErrorModel(
                title: strings.errorEmptyTitle,
                message: strings.errorEmptyMessage,
                retryLabel: strings.errorRetryButton
            )
        case .unknown:
            return BudgetErrorModel(
                title: strings.errorGenericTitle,
                message: strings.errorGenericMessage,
                retryLabel: strings.errorRetryButton
            )
        }
    }

    private func format(_ value: Decimal) -> String {
        currencyFormatter.format(value)
    }
}
