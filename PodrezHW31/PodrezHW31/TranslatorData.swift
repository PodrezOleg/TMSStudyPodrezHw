//
//  TranslatorData.swift
//  PodrezHW31
//
//  Created by Oleg Podrez on 27.10.24.
//

import CoreData

@objc(TranslatorData)
class TranslatorData: NSManagedObject {
    @NSManaged public var name: String?
    @NSManaged public var language: String?
    @NSManaged public var rate: Int16
    @NSManaged public var status: Bool
    
    var statusDescription: String {
        return status ? "Свободен" : "Занят"
    }
}

extension TranslatorData {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<TranslatorData> {
        return NSFetchRequest<TranslatorData>(entityName: "TranslatorData")
    }
}
