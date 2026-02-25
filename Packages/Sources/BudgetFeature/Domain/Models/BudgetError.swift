import Foundation

public enum BudgetError: Error, Equatable {
    case networkUnavailable
    case emptyResponse
    case unknown
}
