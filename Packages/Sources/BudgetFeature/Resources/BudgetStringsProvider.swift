import Foundation

public struct BudgetStringsProvider {

    public init() {}

    // Overview
    /// "budget.overview.title" = "This Month"
    public var overviewNavigationTitle: String = "budget.overview.title".localized()
    
    /// "budget.overview.categories_header" = "Categories"
    public var overviewCategoriesHeader: String = "budget.overview.categories_header".localized()
    
    /// "budget.overview.summary_spent" = "Spent"
    public var overviewSummarySpent: String = "budget.overview.summary_spent".localized()
    
    /// "budget.overview.summary_of" = "of"
    public var overviewSummaryOf: String = "budget.overview.summary_of".localized()
    
    /// "budget.overview.remaining" = "Remaining"
    public var overviewRemaining: String = "budget.overview.remaining".localized()

    // Category row
    /// "budget.category.of" = "Category of"
    public var categoryOf: String = "budget.category.of".localized()
    
    // Category detail
    /// "budget.detail.spent" = "Spent"
    public var detailSpent: String = "budget.detail.spent".localized()
    
    /// "budget.detail.remaining" = "Remaining"
    public var detailRemaining: String = "budget.detail.remaining".localized()
    
    /// "budget.detail.progress_header" = "Progress"
    public var detailProgressHeader: String = "budget.detail.progress_header".localized()
    
    /// "budget.detail.transactions_header" = "Transactions"
    public var detailTransactionsHeader: String = "budget.detail.transactions_header".localized()
    
    /// "budget.detail.no_transactions" = "No transactions available."
    public var detailNoTransactions: String = "budget.detail.no_transactions".localized()
    
    // Errors
    /// "budget.error.network.title" = "Network Error"
    public var errorNetworkTitle: String = "budget.error.network.title".localized()
    
    /// "budget.error.network.message" = "Unable to connect to the server. Please check your internet connection."
    public var errorNetworkMessage: String = "budget.error.network.message".localized()
    
    /// "budget.error.empty.title" = "No Data"
    public var errorEmptyTitle: String = "budget.error.empty.title".localized()
    
    /// "budget.error.empty.message" = "No data available at the moment."
    public var errorEmptyMessage: String = "budget.error.empty.message".localized()
    
    /// "budget.error.generic.title" = "Error"
    public var errorGenericTitle: String = "budget.error.generic.title".localized()
    
    /// "budget.error.generic.message" = "An unexpected error occurred. Please try again later."
    public var errorGenericMessage: String = "budget.error.generic.message".localized()
    
    /// "budget.error.retry" = "Retry"
    public var errorRetryButton: String = "budget.error.retry".localized()
}
