@testable import BudgetFeature
import XCTest

final class LoadBudgetUseCaseTests: XCTestCase {
    func test_execute_returnsBudgetOnSuccess() async throws {
        let useCase = LoadBudgetUseCase(
            repository: MockBudgetRepository(result: .success(MockBudget.singleCategoryBudget))
        )
        
        let budget = try await useCase.execute()
        
        XCTAssertEqual(budget, MockBudget.singleCategoryBudget)
    }
    
    func test_execute_throwsEmptyResponse_whenCategoriesAreEmpty() async throws {
        let useCase = LoadBudgetUseCase(
            repository: MockBudgetRepository(result: .failure(BudgetError.emptyResponse))
        )
        
        do {
            _ = try await useCase.execute()
        } catch let error as BudgetError {
            XCTAssertEqual(error, .emptyResponse)
        }
    }
    
    func test_execute_rethrowsRepositoryError() async throws {
        let useCase = LoadBudgetUseCase(
            repository: MockBudgetRepository(result: .failure(BudgetError.networkUnavailable))
        )
        
        do {
            _ = try await useCase.execute()
        } catch let error as BudgetError {
            XCTAssertEqual(error, .networkUnavailable)
        }
    }
}

