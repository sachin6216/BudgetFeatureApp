import BudgetFeature
import SwiftUI

@main
struct BudgetFeatureAppApp: App {
    var body: some Scene {
        WindowGroup {
            BudgetOverviewView()
        }
    }
}

struct Budget_Previews: PreviewProvider {
    static var previews: some View {
        BudgetOverviewView()
    }
}
