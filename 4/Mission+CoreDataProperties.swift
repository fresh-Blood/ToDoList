//
//  Mission+CoreDataProperties.swift
//  4
//
//  Created by Admin on 13.10.2021.
//
//

import Foundation
import CoreData


extension Mission {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Mission> {
        return NSFetchRequest<Mission>(entityName: "Mission")
    }

    @NSManaged public var name: String?
    @NSManaged public var date: String?
    @NSManaged public var status: String?
    @NSManaged public var deadLine: String?
    @NSManaged public var info: String?

}

extension Mission : Identifiable {

}
