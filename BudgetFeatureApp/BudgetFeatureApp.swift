import BudgetFeature
import SwiftUI

@main
struct BudgetFeatureApp: App {
    var body: some Scene {
        WindowGroup {
            BudgetFeatureEntry.makeRootView()
        }
    }
}

struct Budget_Previews: PreviewProvider {
    static var previews: some View {
        BudgetFeatureEntry.makeRootView()
    }
}
