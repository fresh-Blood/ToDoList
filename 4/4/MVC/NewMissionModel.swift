import Foundation
import UIKit


final class NewMission : NSObject, NSCoding {
    
    var name: String
    var aboutInfo: String
    var date: String
    var deadLine: String
    
    init(name: String, aboutInfo: String, date: String, deadLine: String) {
        self.name = name
        self.aboutInfo = aboutInfo
        self.deadLine = deadLine
        self.date = date
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(aboutInfo, forKey: "aboutInfo")
        coder.encode(date, forKey: "date")
        coder.encode(deadLine, forKey: "deadLine")
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as? String ?? ""
        aboutInfo = coder.decodeObject(forKey: "aboutInfo") as? String ?? ""
        date = coder.decodeObject(forKey: "date") as? String ?? ""
        deadLine = coder.decodeObject(forKey: "deadLine") as? String ?? ""
    }
    

}

final class MissionModel {
    
    static let shared = MissionModel()
    
    var missions : [NewMission] = []
    
    var name: String = ""
    var aboutInfo: String = ""
    var date: String = ""
    var deadLine: String = ""
    
    func addNewMission() {
        let mission = NewMission(name: name, aboutInfo: aboutInfo, date: date, deadLine: deadLine)
        missions.append(mission)
    }
}
