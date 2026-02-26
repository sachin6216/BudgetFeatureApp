import Foundation

extension String {
    func localized(bundle: Bundle = .module) -> String {
        NSLocalizedString(self, bundle: bundle, comment: "")
    }
}
