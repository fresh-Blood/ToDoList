import Foundation
import UIKit


final class Store {
    
    private enum SettingsKeys : String {
        case addedMissions
        case deletedMissions
    }
    
    static var addedMissions: [NewMission]! {
        get {
            guard let savedData = UserDefaults.standard.object(forKey: SettingsKeys.addedMissions.rawValue) as? Data, let decodedModel = try?
                    NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData) as? [NewMission] else { return [] }
            return decodedModel
        }
        set {
            let defaults = UserDefaults.standard
            let key = SettingsKeys.addedMissions.rawValue
            
            if let missionModel = newValue {
                if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: missionModel, requiringSecureCoding: false) {
                    defaults.set(savedData, forKey: key)
                }
            }
        }
    }
    static var deletedMissions: [NewMission]! {
        get {
            guard let savedData1 = UserDefaults.standard.object(forKey: SettingsKeys.deletedMissions.rawValue) as? Data, let decodedModel1 = try?
                    NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData1) as? [NewMission] else { return [] }
            return decodedModel1
        }
        set {
            let defaults1 = UserDefaults.standard
            let key1 = SettingsKeys.deletedMissions.rawValue
            
            if let missionModel1 = newValue {
                if let savedData1 = try? NSKeyedArchiver.archivedData(withRootObject: missionModel1, requiringSecureCoding: false) {
                    defaults1.set(savedData1, forKey: key1)
                }
            }
        }
    }
    
}



