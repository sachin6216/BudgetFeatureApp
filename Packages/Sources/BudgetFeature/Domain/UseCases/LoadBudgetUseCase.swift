import Foundation

public protocol LoadBudgetUseCaseProtocol {
    func execute() async throws -> Budget
}

struct LoadBudgetUseCase: LoadBudgetUseCaseProtocol {
    private let repository: BudgetRepository

    init(repository: BudgetRepository) {
        self.repository = repository
    }

    func execute() async throws -> Budget {
        let budget = try await repository.fetchBudget()
        guard !budget.categories.isEmpty else {
            throw BudgetError.emptyResponse
        }
        return budget
    }
}
