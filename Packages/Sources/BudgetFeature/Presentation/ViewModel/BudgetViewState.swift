import Foundation

enum BudgetViewState {
    case loading
    case loaded(Budget)
    case error(BudgetError)
}
