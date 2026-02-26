import SwiftUI

enum BudgetStyle {
    
    // MARK: - Typography
    
    enum Font {
        static let caption = SwiftUI.Font.caption
        static let subheadline = SwiftUI.Font.subheadline
        static let subheadlineMedium = SwiftUI.Font.subheadline.weight(.medium)
        static let subheadlineSemibold = SwiftUI.Font.subheadline.weight(.semibold)
        static let summaryTitle = SwiftUI.Font.title3.weight(.semibold)
        static let sectionHeader = SwiftUI.Font.footnote.weight(.medium)
        static let errorTitle = SwiftUI.Font.headline
    }
    
    
    // MARK: - Spacing
    
    enum Spacing {
        static let xxs: CGFloat = 2
        static let xs: CGFloat = 4
        static let sm: CGFloat = 6
        static let md: CGFloat = 8
        static let lg: CGFloat = 12
        static let xl: CGFloat = 16
        static let xxl: CGFloat = 20
        static let xxxl: CGFloat = 32
    }
    
    // MARK: - Sizing
    
    enum Size {
        static let categoryIconFrame: CGFloat = 28
        static let errorIconSize: CGFloat = 44
        static let featureDisabledIconSize: CGFloat = 36
    }
    
    // MARK: - Shape
    
    enum Shape {
        static let categoryIconCornerRadius: CGFloat = 7
    }
}
