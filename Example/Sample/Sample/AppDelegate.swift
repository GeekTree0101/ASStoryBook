import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
         window = UIWindow(frame: UIScreen.main.bounds)
        let rootViewController = SampleNodeController()
        let navigationController =
            UINavigationController(rootViewController: rootViewController)
        if let window = window {
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }

        return true
    }
}

