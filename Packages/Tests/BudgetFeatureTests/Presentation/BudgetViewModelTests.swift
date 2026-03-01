@testable import BudgetFeature
import XCTest

@MainActor
final class BudgetViewModelTest: XCTestCase {
    private var mockUseCase: MockLoadBudgetUseCase!
    private var mockViewModel: BudgetViewModel!
    private var mockCurrencyFormatterConfiguration = CurrencyFormatterConfiguration(currencyCode: "EUR")
    
    override func setUp() {
        super.setUp()
        mockUseCase = MockLoadBudgetUseCase()
        mockViewModel = BudgetViewModel(
            useCase: mockUseCase,
            configuration: BudgetConfiguration(currencyFormatterConfiguration: mockCurrencyFormatterConfiguration)
        )
    }
    
    override func tearDown() {
        mockUseCase = nil
        mockViewModel = nil
        super.tearDown()
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
        mockUseCase.executeHandler = {
            throw MockError()
        }
        
        await mockViewModel.load()
        
        guard case .error(let error) = mockViewModel.state else {
            return XCTFail("Expected .error state, got \(mockViewModel.state)")
        }
        
        XCTAssertEqual(error, .unknown)
    }
    
    // MARK: - Model Builders
    
    // Verifies that the summary model calculates and formats the remaining amount correctly
    func test_makeSummaryModel_calculatesRemainingCorrectly() {
        let budget = MockBudget.singleCategoryBudget
        let model = mockViewModel.makeSummaryModel(for: budget)
        
        let expectedRemaining = budget.total - budget.spent
        
        let formatter = CurrencyFormatter(configuration: mockCurrencyFormatterConfiguration)
        
        let expectedFormatted = formatter.format(expectedRemaining)
        
        XCTAssertEqual(model.remainingLabel, expectedFormatted)
    }
    
    // Verifies that category row models map domain values and format amounts correctly
    func test_makeCategoryRowModels_mapsCategoryValuesAndFormatsAmountsCorrectly() {
        let budget = MockBudget.singleCategoryBudget
        let category = budget.categories.first!
        
        let models = mockViewModel.makeCategoryRowModels(for: budget)
        let model = try! XCTUnwrap(models.first)
        
        let formatter = CurrencyFormatter(configuration: mockCurrencyFormatterConfiguration)
        
        XCTAssertEqual(model.id, category.id)
        XCTAssertEqual(model.name, category.name)
        
        XCTAssertEqual(model.spentLabel, formatter.format(category.spent))
        XCTAssertEqual(model.totalLabel, formatter.format(category.total))
    }
}
