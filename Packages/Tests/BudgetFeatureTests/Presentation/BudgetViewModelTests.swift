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
    
    // Initially State sets to loading
    func test_load_setsLoadingStateInitially() async {
        if case .loading = mockViewModel.state {} else {
            XCTFail("Expected initial state to be .loading")
        }
    }
    
    // Succesfully retrun Budget result
    func test_load_setsLoadedStateOnSuccess() async {
        mockUseCase.result = .success(MockBudget.singleCategoryBudget)
        
        await mockViewModel.load()
        
        guard case .loaded(let budget) = mockViewModel.state else {
            return XCTFail("Expected .loaded state, got \(mockViewModel.state)")
        }
        
        XCTAssertEqual(budget, MockBudget.singleCategoryBudget)
    }
    
    // Getting error state on networkUnavailable
    func test_load_setsErrorStateOnNetworkError() async {
        mockUseCase.result = .failure(BudgetError.networkUnavailable)

        await mockViewModel.load()

        guard case .error(let error) = mockViewModel.state else {
            return XCTFail("Expected .error state, got \(mockViewModel.state)")
        }
        
        XCTAssertEqual(error, .networkUnavailable)
    }
    
    // Getting error state on Empty response
    func test_load_setsEmptyResponseError() async {
        mockUseCase.result = .failure(BudgetError.emptyResponse)

        await mockViewModel.load()

        guard case .error(let error) = mockViewModel.state else {
            return XCTFail("Expected .error state, got \(mockViewModel.state)")
        }
        
        XCTAssertEqual(error, .emptyResponse)
    }
    
    // Getting error state on Unkonown Error
    func test_load_setsUnknownErrorForNonBudgetErrors() async {
        mockUseCase.result = .failure(BudgetError.unknown)

        await mockViewModel.load()

        guard case .error(let error) = mockViewModel.state else {
            return XCTFail("Expected .error state, got \(mockViewModel.state)")
        }
        
        XCTAssertEqual(error, .unknown)
    }
    
    // makeSummaryModel()
    func test_makeSummaryModel_progressIsCorrect() {
        let budget = MockBudget.singleCategoryBudget
        let model = mockViewModel.makeSummaryModel(for: budget)
        XCTAssertEqual(model.progress, 0.5)
    }
    
    // makeCategoryRowModels()
    func test_makeCategoryRowModels_countMatchesBudgetCategories() {
        let budget = MockBudget.singleCategoryBudget
        let models = mockViewModel.makeCategoryRowModels(for: budget)
        XCTAssertEqual(models.count, budget.categories.count)
    }
    
    // makeCategoryDetailModel()
    func test_makeCategoryDetailModel_nameMatches() {
        let budgetCategory = MockBudget.overBudgetCategory
        let model = mockViewModel.makeCategoryDetailModel(for: budgetCategory)
        XCTAssertEqual(model.name, budgetCategory.name)
    }
}
