import Foundation

public protocol BudgetRepository {
    func fetchBudget() async throws -> Budget
}
