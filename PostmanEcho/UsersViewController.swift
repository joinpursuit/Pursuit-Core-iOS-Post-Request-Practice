import UIKit

class UsersViewController: UIViewController {
    var users = [User]() {
        didSet {
            usersTableView.reloadData()
        }
    }
    @IBOutlet var usersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        loadData()
    }
    
    private func configureTableView() {
        usersTableView.dataSource = self
        usersTableView.delegate = self
    }
    
    private func loadData() {
        users = BundleFetchingService<User>().getArray(from: "userData",
                                                       ofType: "json")
    }
}

extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name.first + " " + user.name.last
        cell.detailTextLabel?.text = user.phone
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
}

extension UsersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Send a post request to favorite user named \(users[indexPath.row].name)")
    }
}
