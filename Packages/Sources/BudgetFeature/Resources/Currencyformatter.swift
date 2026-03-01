import Foundation

struct CurrencyFormatter {
    private let formatter: NumberFormatter
    private let currencyCode: String

    init(configuration: CurrencyFormatterConfiguration = CurrencyFormatterConfiguration()) {
        self.currencyCode = configuration.currencyCode
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .currency
        numFormatter.currencyCode = configuration.currencyCode
        numFormatter.minimumFractionDigits = configuration.minimumFractionDigits
        numFormatter.maximumFractionDigits = configuration.maximumFractionDigits
        self.formatter = numFormatter
    }

    func format(_ value: Decimal) -> String {
        formatter.string(from: NSDecimalNumber(decimal: value)) ?? "\(currencyCode) \(value)"
    }
}
