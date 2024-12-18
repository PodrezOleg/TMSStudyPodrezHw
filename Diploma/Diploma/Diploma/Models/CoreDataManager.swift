//
//  CoreDataManager.swift
//  Diploma
//
//  Created by Oleg Podrez on 4.12.24.
//

import CoreData
import UIKit

class CoreDataManager {
    static let shared = CoreDataManager()
    private init() {}
    

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
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
    
    func createUser(name: String, password: String, dateOfBirth: Date, height: Int, weight: Int, image: UIImage?) -> User {
        let user = User(context: context)
        user.name = name
        user.password = password
        user.dateOfBirth = dateOfBirth
        user.height = Int16(height)
        user.weight = Int16(weight)
        if let imageData = image?.jpegData(compressionQuality: 0.8) {
                 user.avatar = imageData
             }
       
        saveContext()
        return user 
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
    
    func deleteUser(_ user: User) {
        context.delete(user)
        saveContext()
    }
    
    func authenticateUser(name: String, password: String) -> Bool {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@ AND password == %@", name, password)

        do {
            let users = try context.fetch(fetchRequest)
            return !users.isEmpty
        } catch {
            print("Ошибка при аутентификации: \(error)")
            return false
        }
    }
}

