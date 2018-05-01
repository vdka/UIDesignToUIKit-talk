
import UIKit

class AppShowcaseHeaderView: UITableViewHeaderFooterView {

    let largeLabel = UILabel()
    let dateLabel = UILabel()
    let userButton = UIButton()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        contentView.addSubviewEnablingAutoLayout(largeLabel)
        contentView.addSubviewEnablingAutoLayout(dateLabel)
        contentView.addSubviewEnablingAutoLayout(userButton)

        largeLabel.font = UIFont.headerLarge
        dateLabel.font = UIFont.headerSmall

        dateLabel.textColor = UIColor.lightGray

        contentView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20)

        userButton.setImage(#imageLiteral(resourceName: "user"), for: .normal)

        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            dateLabel.trailingAnchor.constraint(lessThanOrEqualTo: userButton.leadingAnchor, constant: 8),
        ])

        NSLayoutConstraint.activate([
            largeLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 4),
            largeLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            largeLabel.trailingAnchor.constraint(lessThanOrEqualTo: userButton.leadingAnchor, constant: 8),
            largeLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor).withPriority(999),
        ])

        NSLayoutConstraint.activate([
            userButton.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            userButton.bottomAnchor.constraint(equalTo: largeLabel.lastBaselineAnchor),
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError(#function)
    }
}

extension AppShowcaseHeaderView {

    func set(date: Date) {
        if date.isToday {
            userButton.isHidden = false
            largeLabel.text = "Today"
            dateLabel.text = DateFormatter.localizedString(from: date, dateStyle: .medium, timeStyle: .none)
        } else {
            userButton.isHidden = true
            let dayFormatter = DateFormatter()
            dayFormatter.dateFormat = "EEEE"
            largeLabel.text = dayFormatter.string(from: date)
            dateLabel.text = DateFormatter.localizedString(from: date, dateStyle: .medium, timeStyle: .none)
        }
    }
}
