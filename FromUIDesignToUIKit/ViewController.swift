
import UIKit
import GameplayKit

class ViewController: UIViewController {

    let tableView = UITableView(frame: .zero, style: .grouped)

    init() {
        super.init(nibName: nil, bundle: nil)

        tableView.separatorStyle = .none
        tableView.register(AppShowcaseCell.self)
        tableView.register(AppShowcaseHeaderView.self)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 350

        tableView.dataSource = self
        tableView.delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError(#function)
    }

    override func loadView() {
        view = UIView()
        view.backgroundColor = .white

        tableView.backgroundColor = .white

        view.addSubviewEnablingAutoLayout(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }

    override func didMove(toParentViewController parent: UIViewController?) {
        super.didMove(toParentViewController: parent)
        if let parent = parent as? UINavigationController {
            parent.setNavigationBarHidden(true, animated: false)
        }
    }

    override var canBecomeFirstResponder: Bool {
        return true
    }

    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        UIApplication.shared.keyWindow?.peek.handleShake(motion)
    }
}

extension ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GKRandomDistribution(forDieWithSideCount: 3).nextInt()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as AppShowcaseCell
        cell.set(AppStoreApp.sample)
        return cell
    }
}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableView() ?? AppShowcaseHeaderView(reuseIdentifier: AppShowcaseHeaderView.reuseIdentifier)
        header.set(date: Date().subtract(days: section))
        return header
    }
}
