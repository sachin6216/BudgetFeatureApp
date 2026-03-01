@testable import BudgetFeature
import Foundation

enum MockBudget {
    
    static let singleCategoryBudget = Budget(
        total: 1000,
        spent: 500,
        categories: [foodCategory]
    )

    static let emptyCategoryBudget = Budget(
        total: 1000,
        spent: 0,
        categories: []
    )

    static let overBudgetCategory = BudgetCategory(
        id: "over",
        name: "Test Over Budget",
        icon: "exclamationmark.circle.fill",
        total: 100,
        spent: 150,
        transactions: []
    )

    static let foodCategory = BudgetCategory(
        id: "test-food",
        name: "Test Food & Drink",
        icon: "fork.knife",
        total: 400,
        spent: 200,
        transactions: [
            Transaction(id: "f1", title: "Test Grocery Store", amount: 30, trancDate: "2026-02-23T14:30:00Z"),
            Transaction(id: "f2", title: "Test Restaurant", amount: 45, trancDate: "2026-02-23T14:30:00Z")
        ]
    )
}

struct MockError: Error {}
