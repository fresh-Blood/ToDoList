//
//  ThirdViewController.swift
//  4
//
//  Created by Admin on 10.10.2021.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
}

extension ThirdViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Presenter.shared.deletedMissions.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! TableViewCell2
        let mission = Presenter.shared.deletedMissions[indexPath.row]
        cell.name.text = mission.name
        cell.info.text = mission.aboutInfo
        cell.deadLine.text = mission.deadLine
        cell.date.text = mission.date
        cell.status.text = "Удалена или выполнена"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let restore = UIContextualAction(style: .normal,title: "Восстановить") { [weak self] (action, view, completionHandler) in
            for (index,element) in Presenter.shared.deletedMissions.enumerated() {
                if index == indexPath.row {
                    MissionModel.shared.missions.insert(element, at: 0)
                }
            }
            Presenter.shared.deletedMissions.remove(at: indexPath.row)
            self?.tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        restore.backgroundColor = .systemOrange
        let configuration = UISwipeActionsConfiguration(actions: [restore])
        return configuration
    }
}
