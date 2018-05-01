
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let vc = ViewController()
        let nav = UINavigationController(rootViewController: vc)
        window!.rootViewController = nav
        window!.makeKeyAndVisible()

        return true
    }
}
