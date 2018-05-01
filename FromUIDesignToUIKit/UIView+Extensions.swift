
import UIKit

extension UIView {

    func addSubviewEnablingAutoLayout(_ subview: UIView) {
        self.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension NSLayoutConstraint {

    func withPriority(_ priority: UILayoutPriority) -> NSLayoutConstraint {
        self.priority = priority
        return self
    }
}

extension UILayoutPriority: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: Int) {
        self.init(rawValue: Float(value))
    }
}
