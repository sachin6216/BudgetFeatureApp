import SwiftUI

struct TransactionRowView: View {

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("Maxima")
                    .font(.subheadline)
                Text("25 Feb")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Text("−$200")
                .font(.subheadline.weight(.medium))
                .foregroundStyle(.primary)
        }
        .padding(.vertical, 2)
    }
}
