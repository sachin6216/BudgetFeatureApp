@testable import BudgetFeature
import XCTest

@MainActor
final class BudgetViewModelTest: XCTestCase {
    private var mockUseCase: MockLoadBudgetUseCase!
    private var mockViewModel: BudgetViewModel!
    
    override func setUp() {
        super.setUp()
        mockUseCase = MockLoadBudgetUseCase()
        mockViewModel = BudgetViewModel(useCase: mockUseCase, configuration: BudgetConfiguration())
    }
    
    override func tearDown() {
        mockUseCase = nil
        mockViewModel = nil
        super.tearDown()
    }
    
    // MARK: - Initial State

    // Verifies that the initial state is set to `.loading`
    func test_load_setsLoadingStateInitially() async {
        if case .loading = mockViewModel.state {} else {
            XCTFail("Expected initial state to be .loading")
        }
    }
    
    // MARK: - Success Scenarios

    // Verifies that a valid Budget response is returned successfully
    func test_load_setsLoadedStateOnSuccess() async {
        mockUseCase.result = .success(MockBudget.singleCategoryBudget)
        
        await mockViewModel.load()
        
        guard case .loaded(let budget) = mockViewModel.state else {
            return XCTFail("Expected .loaded state, got \(mockViewModel.state)")
        }
        
        XCTAssertEqual(budget, MockBudget.singleCategoryBudget)
    }
    
    // MARK: - Error Scenarios
    
    // Verifies that the correct error state is returned when the network is unavailable
    func test_load_setsErrorStateOnNetworkError() async {
        mockUseCase.result = .failure(BudgetError.networkUnavailable)

        await mockViewModel.load()

        guard case .error(let error) = mockViewModel.state else {
            return XCTFail("Expected .error state, got \(mockViewModel.state)")
        }
        
        XCTAssertEqual(error, .networkUnavailable)
    }
    
    // Verifies that the correct error state is returned when the response is empty
    func test_load_setsEmptyResponseError() async {
        mockUseCase.result = .failure(BudgetError.emptyResponse)

        await mockViewModel.load()

        guard case .error(let error) = mockViewModel.state else {
            return XCTFail("Expected .error state, got \(mockViewModel.state)")
        }
        
        XCTAssertEqual(error, .emptyResponse)
    }
    
    // Verifies that the correct error state is returned for an unknown error
    func test_load_setsUnknownErrorForNonBudgetErrors() async {
        mockUseCase.result = .failure(BudgetError.unknown)

        await mockViewModel.load()

        guard case .error(let error) = mockViewModel.state else {
            return XCTFail("Expected .error state, got \(mockViewModel.state)")
        }
        
        XCTAssertEqual(error, .unknown)
    }
    
    // MARK: - Model Builders
    
    // Tests the creation of the summary view model
    func test_makeSummaryModel_progressIsCorrect() {
        let budget = MockBudget.singleCategoryBudget
        let model = mockViewModel.makeSummaryModel(for: budget)
        XCTAssertEqual(model.progress, 0.5)
    }
    
    // Tests the creation of category row view models
    func test_makeCategoryRowModels_countMatchesBudgetCategories() {
        let budget = MockBudget.singleCategoryBudget
        let models = mockViewModel.makeCategoryRowModels(for: budget)
        XCTAssertEqual(models.count, budget.categories.count)
    }
}
