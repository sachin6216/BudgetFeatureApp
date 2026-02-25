import SwiftUI

@MainActor
public enum BudgetFeatureEntry {

    public static func makeRootView() -> some View {
        let repository = BudgetRepositoryImpl()
        let useCase = LoadBudgetUseCase(repository: repository)
        let viewModel = BudgetViewModel(useCase: useCase)
        return BudgetView(viewModel: viewModel)
    }
}
