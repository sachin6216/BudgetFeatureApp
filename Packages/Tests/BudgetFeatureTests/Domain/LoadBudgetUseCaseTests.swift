@testable import BudgetFeature
import XCTest

final class LoadBudgetUseCaseTests: XCTestCase {
    // Verifies that `execute()` returns a Budget
    func test_execute_returnsBudgetOnSuccess() async throws {
        let useCase = LoadBudgetUseCase(
            repository: MockBudgetRepository(result: .success(MockBudget.singleCategoryBudget))
        )
        
        let budget = try await useCase.execute()
        
        XCTAssertEqual(budget, MockBudget.singleCategoryBudget)
    }
    
    // Verifies that `execute()` throws `.emptyResponse`
    func test_execute_throwsEmptyResponse_whenCategoriesAreEmpty() async throws {
        let useCase = LoadBudgetUseCase(
            repository: MockBudgetRepository(result: .success(MockBudget.emptyCategoryBudget))
        )
        
        do {
            _ = try await useCase.execute()
            XCTFail("Expected useCase .emptyResponse")
        } catch let error as BudgetError {
            XCTAssertEqual(error, .emptyResponse)
        }
    }
    
    // Verifies that `execute()` rethrows repository errors
    func test_execute_rethrowsRepositoryError() async throws {
        let useCase = LoadBudgetUseCase(
            repository: MockBudgetRepository(result: .failure(BudgetError.networkUnavailable))
        )
        
        do {
            _ = try await useCase.execute()
            XCTFail("Expected useCase .networkUnavailable")
        } catch let error as BudgetError {
            XCTAssertEqual(error, .networkUnavailable)
        }
    }
}
