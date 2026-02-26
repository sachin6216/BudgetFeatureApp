import BudgetFeature
import SwiftUI

@main
struct BudgetFeatureApp: App {
    private let container = AppDependencyContainer()
    
    var body: some Scene {
        WindowGroup {
            RootView(container: container)
        }
    }
}
