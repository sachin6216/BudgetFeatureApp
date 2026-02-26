@testable import BudgetFeature

struct MockBudgetRepository: BudgetRepository {
    let result: Result<Budget, BudgetError>
    
    func fetchBudget() async throws -> Budget {
        switch result {
        case let .success(budget):
            return budget
        case let .failure(error):
            throw error
        }
    }
}
