@testable import BudgetFeature

final class MockLoadBudgetUseCase: LoadBudgetUseCaseProtocol {
    var result: Result<Budget, BudgetError> = .success(MockBudget.emptyCategoryBudget)

    func execute() async throws -> Budget {
       try result .get()
    }
}
