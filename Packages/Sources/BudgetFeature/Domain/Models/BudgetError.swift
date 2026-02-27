import Foundation

enum BudgetError: Error, Equatable {
    case networkUnavailable
    case emptyResponse
    case unknown
}
