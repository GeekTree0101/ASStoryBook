import UIKit
import ASStoryBook

@UIApplicationMain
class SampleStorybookAppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // MARK: - Setup attribute
        ASStorybookManager.manager.setupAppname("Sample") // Optional
        // ASStorybookManager.manager.setupEnableHitTestDebug() // Optionnal
        
        // MARK: - Setup Categories
        ASStorybookManager.manager.setupCategories([ExampleStorybook.generate,
                                                    SampleStorybook.generate])
        
        // MARK: - Run
        window = ASStorybookManager.manager.didFinishLaunching()
        
        return true
    }
}

