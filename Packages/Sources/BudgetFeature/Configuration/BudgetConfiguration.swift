import Foundation

public struct CurrencyFormatterConfiguration {
    public let currencyCode: String
    public let minimumFractionDigits: Int
    public let maximumFractionDigits: Int

    public init(
        currencyCode: String = "EUR",
        minimumFractionDigits: Int = 2,
        maximumFractionDigits: Int = 2
    ) {
        self.currencyCode = currencyCode
        self.minimumFractionDigits = minimumFractionDigits
        self.maximumFractionDigits = maximumFractionDigits
    }
}

public struct BudgetConfiguration {
    public let currencyFormatterConfiguration: CurrencyFormatterConfiguration
    public let router: BudgetRouter
    public var stringsProvider: BudgetStringsProvider

    public init(
        currencyFormatterConfiguration: CurrencyFormatterConfiguration = CurrencyFormatterConfiguration(),
        router: BudgetRouter = DefaultBudgetRouter(),
        stringsProvider: BudgetStringsProvider = BudgetStringsProvider()
    ) {
        self.currencyFormatterConfiguration = currencyFormatterConfiguration
        self.router = router
        self.stringsProvider = stringsProvider
    }
}
