import Foundation

public struct Transaction: Identifiable, Equatable, Hashable {
    public let id: String
    public let title: String
    public let amount: Decimal
    public let trancDate: String
    public let date: Date
    
    public init(id: String, title: String, amount: Decimal, trancDate: String) {
        self.id = id
        self.title = title
        self.amount = amount
        self.trancDate = trancDate
        self.date = Self.parseDate(trancDate)
    }
    
    private static func parseDate(_ string: String) -> Date {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime]
        return formatter.date(from: string) ?? Date()
    }
}
