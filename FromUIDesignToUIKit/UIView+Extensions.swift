
import UIKit

extension UIView {

    func addSubviewEnablingAutoLayout(_ subview: UIView) {
        self.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
    }
}
