import Foundation

public struct Transaction: Identifiable, Equatable, Hashable {
    public let id: String
    public let title: String
    public let amount: Decimal
    public let date: Date

    public init(id: String, title: String, amount: Decimal, date: Date) {
        self.id = id
        self.title = title
        self.amount = amount
        self.date = date
    }
}
