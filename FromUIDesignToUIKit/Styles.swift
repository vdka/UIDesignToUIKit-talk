
import UIKit

// Color palette

extension UIColor {

    @nonobjc class var brightBlue: UIColor {
        return UIColor(red: 0.0, green: 122.0 / 255.0, blue: 1.0, alpha: 1.0)
    }

    @nonobjc class var lightGray: UIColor {
        return UIColor(red: 142.0 / 255.0, green: 142.0 / 255.0, blue: 147.0 / 255.0, alpha: 1.0)
    }

}

// Text styles

extension UIFont {

    class var headerLarge: UIFont {
        return UIFont.systemFont(ofSize: 34.0, weight: .bold)
    }

    class var headerSmall: UIFont {
        return UIFont.systemFont(ofSize: 13.0, weight: .semibold)
    }

    class var appName: UIFont {
        return UIFont.systemFont(ofSize: 15.0, weight: .semibold)
    }

    class var appSubtitle: UIFont {
        return UIFont.systemFont(ofSize: 13.0, weight: .regular)
    }

    class var appOfTheDay: UIFont {
        return UIFont.systemFont(ofSize: 54.0, weight: .heavy)
    }

    class var getButton: UIFont {
        return UIFont.systemFont(ofSize: 15.0, weight: .bold)
    }

}
