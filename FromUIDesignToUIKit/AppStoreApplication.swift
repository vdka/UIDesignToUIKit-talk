
import UIKit

struct AppStoreApp {
    let name: String
    let subtitle: String
    let icon: UIImage
    let background: UIImage
}

extension AppStoreApp {

    static let sample = AppStoreApp(name: "Design+Code", subtitle: "Learn how to design and code", icon: #imageLiteral(resourceName: "appIcon"), background: #imageLiteral(resourceName: "backgroundImage"))
}
