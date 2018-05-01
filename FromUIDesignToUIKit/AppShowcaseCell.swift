
import UIKit

class AppShowcaseCell: UITableViewCell {

    let cellBackgroundImage = UIImageView()
    let titleLabel = UILabel()

    let backgroundBlurView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.regular))
    let appIconImageView = UIImageView()
    let appNameLabel = UILabel()
    let subtitleLabel = UILabel()
    let getButton = UIButton()

    lazy var shadowLayer = CAShapeLayer()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        let guide = UILayoutGuide()
        contentView.addLayoutGuide(guide)
        selectionStyle = .none

        titleLabel.font = UIFont.appOfTheDay
        appNameLabel.font = UIFont.appName
        subtitleLabel.font = UIFont.appSubtitle
        titleLabel.textColor = .white
        appNameLabel.textColor = .white
        subtitleLabel.textColor = .white

        let style = NSMutableParagraphStyle()
        style.lineHeightMultiple = 0.8
        titleLabel.attributedText = NSAttributedString(string: "APP\nOF THE\nDAY", attributes: [.paragraphStyle: style])
        titleLabel.numberOfLines = 3

        backgroundBlurView.backgroundColor = .clear
        getButton.titleLabel?.font = UIFont.getButton
        getButton.setTitle("GET", for: .normal)
        getButton.setTitleColor(.brightBlue, for: .normal)
        getButton.backgroundColor = .white
        getButton.setContentHuggingPriority(.required, for: .vertical)
        getButton.setContentCompressionResistancePriority(.required, for: .horizontal)
        getButton.contentEdgeInsets = UIEdgeInsets(top: 4, left: 22, bottom: 4, right: 22)
        getButton.titleEdgeInsets = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
        getButton.layer.cornerRadius = getButton.intrinsicContentSize.height / 2
        
        // NOTE: This updates the layoutMarginsGuide
        let inset: CGFloat = 20
        backgroundBlurView.layoutMargins = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        cellBackgroundImage.layoutMargins = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)

        
        cellBackgroundImage.layer.cornerRadius = 13
        cellBackgroundImage.clipsToBounds = true

        contentView.addSubviewEnablingAutoLayout(cellBackgroundImage)
        cellBackgroundImage.addSubviewEnablingAutoLayout(appNameLabel)
        cellBackgroundImage.addSubviewEnablingAutoLayout(titleLabel)

        cellBackgroundImage.addSubviewEnablingAutoLayout(backgroundBlurView)
        backgroundBlurView.contentView.addSubviewEnablingAutoLayout(appIconImageView)
        backgroundBlurView.contentView.addSubviewEnablingAutoLayout(appNameLabel)
        backgroundBlurView.contentView.addSubviewEnablingAutoLayout(subtitleLabel)
        backgroundBlurView.contentView.addSubviewEnablingAutoLayout(getButton)

        NSLayoutConstraint.activate([
            guide.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            guide.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            guide.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            guide.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])

        NSLayoutConstraint.activate([
            cellBackgroundImage.topAnchor.constraint(equalTo: guide.topAnchor),
            cellBackgroundImage.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            cellBackgroundImage.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            cellBackgroundImage.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
        ])

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: cellBackgroundImage.layoutMarginsGuide.leadingAnchor),
            titleLabel.lastBaselineAnchor.constraint(equalTo: backgroundBlurView.topAnchor, constant: -20),
        ])

        NSLayoutConstraint.activate([
            backgroundBlurView.heightAnchor.constraint(greaterThanOrEqualToConstant: 80), // Greater than here supports dynamic type
            backgroundBlurView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            backgroundBlurView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            backgroundBlurView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
        ])

        NSLayoutConstraint.activate([
            appIconImageView.topAnchor.constraint(equalTo: backgroundBlurView.layoutMarginsGuide.topAnchor),
            appIconImageView.bottomAnchor.constraint(equalTo: backgroundBlurView.layoutMarginsGuide.bottomAnchor),
            appIconImageView.leadingAnchor.constraint(equalTo: backgroundBlurView.layoutMarginsGuide.leadingAnchor),
            appIconImageView.heightAnchor.constraint(equalTo: appIconImageView.widthAnchor), // 1:1 aspect ratio
        ])

        NSLayoutConstraint.activate([
            appNameLabel.topAnchor.constraint(equalTo: backgroundBlurView.layoutMarginsGuide.topAnchor),
            appNameLabel.leadingAnchor.constraint(equalTo: appIconImageView.trailingAnchor, constant: 10),
            appNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: getButton.leadingAnchor),
        ])

        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(greaterThanOrEqualTo: appNameLabel.bottomAnchor),
            subtitleLabel.leadingAnchor.constraint(equalTo: appNameLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: getButton.leadingAnchor, constant: -8),
            subtitleLabel.bottomAnchor.constraint(equalTo: backgroundBlurView.layoutMarginsGuide.bottomAnchor).withPriority(999),
        ])

        NSLayoutConstraint.activate([
            getButton.centerYAnchor.constraint(equalTo: backgroundBlurView.centerYAnchor),
            getButton.trailingAnchor.constraint(equalTo: backgroundBlurView.layoutMarginsGuide.trailingAnchor),
        ]) 

        // Add shadow layer
        contentView.layer.addSublayer(shadowLayer)
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        contentView.layer.shadowRadius = 5
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError(#function)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        shadowLayer.shadowPath = UIBezierPath(roundedRect: cellBackgroundImage.frame, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 13, height: 13)).cgPath
    }

    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)

        UIView.animate(withDuration: 0.15, animations: {
            self.cellBackgroundImage.transform = highlighted ? CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95) : CGAffineTransform.identity
        })
    }
}

extension AppShowcaseCell {

    func set(_ app: AppStoreApp) {
        appNameLabel.text = app.name
        subtitleLabel.text = app.subtitle
        appIconImageView.image = app.icon
        cellBackgroundImage.image = app.background
    }
}
