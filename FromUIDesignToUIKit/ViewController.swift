
import UIKit

class ViewController: UIViewController {

    let tableView = UITableView()

    init() {
        super.init(nibName: nil, bundle: nil)

        tableView.separatorStyle = .none
        tableView.register(AppShowcaseCell.self)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 350

        tableView.dataSource = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError(#function)
    }

    override func loadView() {
        view = UIView()
        view.backgroundColor = .white

        view.addSubviewEnablingAutoLayout(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as AppShowcaseCell
        cell.set(AppStoreApp.sample)
        return cell
    }
}
