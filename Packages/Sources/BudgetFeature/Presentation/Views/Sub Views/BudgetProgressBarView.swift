import SwiftUI

struct BudgetProgressBar: View {
    let progress: Double

    var body: some View {
        ProgressView(value: progress)
            .progressViewStyle(.linear)
            .animation(.easeInOut(duration: 0.4), value: progress)
    }
}
