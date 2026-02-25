import Combine
import Foundation

@MainActor
internal final class BudgetViewModel: ObservableObject {

    @Published public private(set) var state: BudgetViewState = .loading

    private let useCase: LoadBudgetUseCaseProtocol

    public init(useCase: LoadBudgetUseCaseProtocol) {
        self.useCase = useCase
    }

    public func load() async {
        state = .loading
        do {
            let budget = try await useCase.execute()
            state = .loaded(budget)
        } catch let error as BudgetError {
            state = .error(error)
        } catch {
            state = .error(.unknown)
        }
    }
}
