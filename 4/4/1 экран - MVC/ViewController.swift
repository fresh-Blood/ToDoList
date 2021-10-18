// Архитектура первого экрана - MVC

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var info: UITextField!
    @IBOutlet weak var date: UITextField!
    @IBOutlet weak var deadLine: UITextField!
    let datePicker = UIDatePicker()
    let datePicker2 = UIDatePicker()
    let toolBar = UIToolbar()
    let toolBar2 = UIToolbar()
    
    func showDatePicker(datePicker:UIDatePicker, toolBar: UIToolbar, item:UITextField) {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.frame = CGRect(x: self.view.frame.minX, y: self.view.frame.height/3, width: self.view.frame.width, height: datePicker.bounds.height)
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker))
        toolBar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        item.inputView = datePicker
        item.inputAccessoryView = toolBar
    }
    
    @objc func donedatePicker(sender: UIButton!){
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        formatter.dateFormat = "dd/MM/yyyy"
        date.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    func showDatePicker2(datePicker:UIDatePicker, toolBar: UIToolbar, item:UITextField) {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.frame = CGRect(x: self.view.frame.minX, y: self.view.frame.height/3, width: self.view.frame.width, height: datePicker.bounds.height)
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker2))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker))
        toolBar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        item.inputView = datePicker
        item.inputAccessoryView = toolBar
    }
    
    @objc func donedatePicker2(sender: UIButton!){
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        formatter.dateFormat = "dd/MM/yyyy"
        deadLine.text = formatter.string(from: datePicker2.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(sender: UIButton!){
        self.view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showDatePicker(datePicker: datePicker, toolBar: toolBar, item: date)
        showDatePicker2(datePicker: datePicker2, toolBar: toolBar2, item: deadLine)
        print("В массиве актуальные задачи сохранены -  \(Store.addedMissions ?? [])")
        print("В массиве удаленные или закрытые задачи сохранены - \(Store.deletedMissions ?? [])")
    }
    
    @IBAction func addNewMission(_ sender: Any) {
        MissionModel.shared.name = name.text ?? "Empty"
        MissionModel.shared.date = date.text ?? "Empty"
        MissionModel.shared.aboutInfo = info.text ?? "Empty"
        MissionModel.shared.deadLine = deadLine.text ?? "Empty"
        MissionModel.shared.addNewMission()
        name.text = ""
        date.text = ""
        info.text = ""
        deadLine.text = ""
    }
}

