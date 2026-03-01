@testable import BudgetFeature

final class MockLoadBudgetUseCase: LoadBudgetUseCaseProtocol {
    var result: Result<Budget, BudgetError> = .success(MockBudget.emptyCategoryBudget)
    var executeHandler: (() async throws -> Budget)?
    
    func execute() async throws -> Budget {
        if let handler = executeHandler {
            return try await handler()
        }
        return try result.get()
    }
}
