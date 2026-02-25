import Foundation

public final class BudgetRepositoryImpl: BudgetRepository {
    public init() {}

    public func fetchBudget() async throws -> Budget {
        try await Task.sleep(for: .seconds(1))
        let shouldFail = false
        if shouldFail { throw BudgetError.networkUnavailable }
        
        return .stub
    }
}

// MARK: -  Mock data
private extension Budget {
    
    static let stub = Budget(
        total: 1_500,
        spent: 870,
        categories: [
            BudgetCategory(
                id: "food",
                name: "Food & Drink",
                icon: "fork.knife",
                total: 400,
                spent: 310,
                transactions: [
                    Transaction(id: "f1", title: "Rimi Supermarket", amount: 62.40, date: .daysAgo(1)),
                    Transaction(id: "f2", title: "Hesburger", amount: 11.90, date: .daysAgo(3)),
                    Transaction(id: "f3", title: "Coffee Inn", amount: 4.20,  date: .daysAgo(4)),
                    Transaction(id: "f4", title: "Maxima", amount: 48.70, date: .daysAgo(6)),
                    Transaction(id: "f5", title: "Double Coffee", amount: 8.50,  date: .daysAgo(8))
                ]
            ),
            BudgetCategory(
                id: "transport",
                name: "Transport",
                icon: "tram.fill",
                total: 200,
                spent: 94,
                transactions: [
                    Transaction(id: "tr1", title: "Bolt ride", amount: 7.80,  date: .daysAgo(2)),
                    Transaction(id: "tr2", title: "Riga public transit",amount: 30.00, date: .daysAgo(5)),
                    Transaction(id: "tr3", title: "Bolt ride", amount: 9.20,  date: .daysAgo(9)),
                    Transaction(id: "tr4", title: "CityBee", amount: 14.50, date: .daysAgo(12))
                ]
            ),
            BudgetCategory(
                id: "shopping",
                name: "Shopping",
                icon: "bag.fill",
                total: 300,
                spent: 286,
                transactions: [
                    Transaction(id: "s1", title: "Zara", amount: 79.99, date: .daysAgo(3)),
                    Transaction(id: "s2", title: "Euronics", amount: 129.00, date: .daysAgo(7)),
                    Transaction(id: "s3", title: "Drogas", amount: 23.45, date: .daysAgo(10)),
                    Transaction(id: "s4", title: "H&M", amount: 54.00, date: .daysAgo(14))
                ]
            ),
            BudgetCategory(
                id: "entertainment",
                name: "Entertainment",
                icon: "popcorn.fill",
                total: 150,
                spent: 110,
                transactions: [
                    Transaction(id: "e1", title: "Spotify", amount: 9.99,  date: .daysAgo(1)),
                    Transaction(id: "e2", title: "Forum Cinemas", amount: 24.00, date: .daysAgo(8)),
                    Transaction(id: "e3", title: "Steam", amount: 19.99, date: .daysAgo(11)),
                    Transaction(id: "e4", title: "Netflix", amount: 15.99, date: .daysAgo(15))
                ]
            ),
            BudgetCategory(
                id: "health",
                name: "Health",
                icon: "cross.fill",
                total: 100,
                spent: 70,
                transactions: [
                    Transaction(id: "h1", title: "Euroaptieka", amount: 22.60, date: .daysAgo(4)),
                    Transaction(id: "h2", title: "Sports club", amount: 35.00, date: .daysAgo(9)),
                    Transaction(id: "h3", title: "Doc+", amount: 12.00, date: .daysAgo(13))
                ]
            )
        ]
    )
}

private extension Date {
    static func daysAgo(_ days: Int) -> Date {
        Calendar.current.date(byAdding: .day, value: -days, to: Date()) ?? Date()
    }
}
