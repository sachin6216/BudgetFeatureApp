import SwiftUI

@MainActor
public enum BudgetFeatureEntry {

    public static func makeRootView(configuration: BudgetConfiguration) -> some View {
        let repository = BudgetRepositoryImpl()
        let useCase = LoadBudgetUseCase(repository: repository)
        let viewModel  = BudgetViewModel(useCase: useCase, configuration: configuration)
        return BudgetView(viewModel: viewModel)
    }
}
