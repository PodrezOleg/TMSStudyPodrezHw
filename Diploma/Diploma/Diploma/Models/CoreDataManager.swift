//
//  CoreDataManager.swift
//  Diploma
//
//  Created by Oleg Podrez on 4.12.24.
//

import CoreData
class CoreDataManager {
    static let shared = CoreDataManager()
    private init() {}
    
    
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Diploma") 
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Ошибка загрузки Core Data: \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    func createUser(name: String, dateOfBirth: Date, height: Int, weight: Int, allergies: String) {
        let user = User(context: context)
        user.name = name
        user.dateOfBirth = dateOfBirth
        user.height = Int16(height)
        user.weight = Int16(weight)
        user.allergies = allergies
        
        saveContext()
    }
    
    func saveContext() {
        if context.hasChanges{
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError(" Ошибка Сохранения: \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
