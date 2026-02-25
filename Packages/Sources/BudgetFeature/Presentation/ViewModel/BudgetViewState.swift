import Foundation

public enum BudgetViewState {
    case loading
    case loaded(Budget)
    case error(BudgetError)
}
