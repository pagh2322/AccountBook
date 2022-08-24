//
//  CoreDataManager.swift
//  AccountBook
//
//  Created by peo on 2022/08/24.
//

import CoreData

final class CoreDataManager {
    static let shared = CoreDataManager()
    
    private init() { }
    
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
                context.rollback()
            }
        }
    }
    
    func fetchMonthly(date: Date) -> Monthly? {
        let request = Monthly.fetchRequest()
        request.predicate = NSPredicate(format: "date == %@", DateManager.convertToString(date: date))
        
        do {
            return try context.fetch(request).first
        } catch {
            fatalError()
        }
    }
    
    func fetchMonthlyHistories(date: Date) -> [History] {
        guard let monthly = fetchMonthly(date: date) else { return [] }
        
        return monthly.histories?.array as? [History] ?? []
    }
    
    func saveHistory(history: History) {
        if let monthly = fetchMonthly(date: history.date!) {
            monthly.addToHistories(history)
        } else {
            let monthly = Monthly(context: context)
            monthly.date = DateManager.convertToString(date: history.date!)
            monthly.addToHistories(history)
        }
        
        saveContext()
    }
    
    func deleteHistory(history: History) {
        context.delete(history)
        
        saveContext()
    }
}
