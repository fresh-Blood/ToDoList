import UIKit

final class SecondViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }
}
extension SecondViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MissionModel.shared.missions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let mission = MissionModel.shared.missions[indexPath.row]
        cell.name.text = mission.name
        cell.info.text = mission.aboutInfo
        cell.data.text = mission.date
        cell.deadline.text = mission.deadLine
        cell.status.text = "Создана"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // зыкрыть
        let archive = UIContextualAction(style: .normal,title: "Закрыть") { [weak self] (action, view, completionHandler) in
            for (index,element) in MissionModel.shared.missions.enumerated() {
                if index == indexPath.row {
                    Presenter.shared.deletedMissions.insert(element, at: 0)
                }
            }
            MissionModel.shared.missions.remove(at: indexPath.row)
            self?.tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        archive.backgroundColor = .systemGreen
        
        // удалить
        let trash = UIContextualAction(style: .destructive,title: "Удалить") { [weak self] (action, view, completionHandler) in
            for (index,element) in MissionModel.shared.missions.enumerated() {
                if index == indexPath.row {
                    Presenter.shared.deletedMissions.insert(element, at: 0)
                }
            }
            MissionModel.shared.missions.remove(at: indexPath.row)
            self?.tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        trash.backgroundColor = .systemRed
        
        let configuration = UISwipeActionsConfiguration(actions: [trash, archive])
        return configuration
    }
}



