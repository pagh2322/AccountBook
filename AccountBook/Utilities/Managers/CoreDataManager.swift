//
//  CoreDataManager.swift
//  AccountBook
//
//  Created by peo on 2022/08/24.
//

import CoreData

final class CoreDataManager {
    static let shared = CoreDataManager()
    
    private init() {
//        context = persistentContainer.viewContext
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "History")
        container.loadPersistentStores { storeDescription, error in
            guard let error = error else {
                return
            }
        }
        return container
    }()
    
    lazy var context: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                fatalError()
            }
        }
    }
}
