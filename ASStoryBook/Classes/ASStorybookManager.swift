import Foundation
import AsyncDisplayKit

public struct ASStorybookManager {
    typealias GroupCategory = ASStoryBookGroupCategory
    typealias Manager = ASStorybookManager
    
    static var manager: ASStorybookManager = .init()
    private var setEnableHitTestDebug: Bool = false
    private var appName: String = "Stoybook"
    var categories: [GroupCategory] = []
    
    @discardableResult mutating func setupEnableHitTestDebug() -> Manager {
        setEnableHitTestDebug = true
        return self
    }
    
    @discardableResult mutating func setupAppname(_ name: String) -> Manager {
        self.appName = name + " Storybook"
        return self
    }
    
    func didFinishLaunching() -> UIWindow {
        let rootViewController = ASStorybookMainNodeController()
        rootViewController.title = appName
        let navigationController =
            UINavigationController(rootViewController: rootViewController)
        UINavigationBar.applyStorybookAppearance()
        let window = UIWindow()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        ASControlNode.enableHitTestDebug = self.setEnableHitTestDebug
        return window
    }
}

// Category
extension ASStorybookManager {
    @discardableResult mutating func setupCategories(_ categories: [GroupCategory]) -> Manager {
        self.categories = categories
        return self
    }
    
    @discardableResult mutating func appendCategory(_ category: GroupCategory) -> Manager {
        self.categories.append(category)
        return self
    }
}




