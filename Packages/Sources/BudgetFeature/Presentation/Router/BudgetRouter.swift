import SwiftUI

public enum BudgetDestination: Hashable {
    case categoryDetail(BudgetCategory)
}

@MainActor
public final class BudgetNavigationStack: ObservableObject {
    @Published public var path: [BudgetDestination] = []

    nonisolated public init() {}

    public func push(_ destination: BudgetDestination) {
        path.append(destination)
    }

    public func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }

    public func popToRoot() {
        path.removeAll()
    }
}

public protocol BudgetRouter {
    @MainActor
    func view(for destination: BudgetDestination, context: BudgetRouterContext) -> AnyView
}


public struct BudgetRouterContext {
    let currencyFormatterConfiguration: CurrencyFormatterConfiguration
    let strings: BudgetStringsProvider

    init(currencyFormatterConfiguration: CurrencyFormatterConfiguration,
         strings: BudgetStringsProvider) {
        self.currencyFormatterConfiguration = currencyFormatterConfiguration
        self.strings = strings
    }
}


public struct DefaultBudgetRouter: BudgetRouter {
    public init() {}

    @MainActor
    public func view(for destination: BudgetDestination, context: BudgetRouterContext) -> AnyView {
        switch destination {
        case .categoryDetail(let category):
            let factory = CategoryDetailModelFactory(
                strings: context.strings,
                formatter: CurrencyFormatter(configuration: context.currencyFormatterConfiguration)
            )
            return AnyView(CategoryDetailView(model: factory.make(for: category)))
        }
    }
}
