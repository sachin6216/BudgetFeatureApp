import Foundation

public protocol LoadBudgetUseCaseProtocol {
    func execute() async throws -> Budget
}

// MARK: - Concrete implementation

public struct LoadBudgetUseCase: LoadBudgetUseCaseProtocol {

    private let repository: BudgetRepository

    public init(repository: BudgetRepository) {
        self.repository = repository
    }

    public func execute() async throws -> Budget {
        let budget = try await repository.fetchBudget()
        guard !budget.categories.isEmpty else {
            throw BudgetError.emptyResponse
        }
        return budget
    }
}
