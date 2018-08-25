import Foundation
import UIKit

extension UINavigationBar {
    static func applyStorybookAppearance() {
        UINavigationBar.appearance().backgroundColor = .white
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().tintColor = .storybook
        UINavigationBar.appearance()
            .setBackgroundImage(UIImage.from(color: .white),
                                for: .any,
                                barMetrics: .default)
    }
}
