//
//  CoreDataStack.swift
//  AccountBook
//
//  Created by peo on 2022/08/24.
//

import CoreData
import SwiftUI

final class CoreDataStack {
	
	static let shared = CoreDataStack()
	private init() { }
	
	private lazy var persistentContainer: NSPersistentContainer = {
		let container = NSPersistentContainer(name: "Entities")
		container.loadPersistentStores { storeDescription, error in
			guard let error = error else {
				return
			}
		}
		return container
	}()
	
	private lazy var context: NSManagedObjectContext = {
		return persistentContainer.viewContext
	}()
	
	private func saveContext() {
		guard context.hasChanges else { return }
		
		do {
			try context.save()
		} catch {
			context.rollback()
		}
	}
	
	func fetchAllCategories() -> [CategoryEntity] {
		let request = CategoryEntity.fetchRequest()
		
		do {
			return try context.fetch(request)
		} catch {
			fatalError()
		}
	}
	
	func fetchCategory(name: String) -> CategoryEntity? {
		let request = CategoryEntity.fetchRequest()
		request.predicate = NSPredicate(format: "name == %@", name)
		
		do {
			return try context.fetch(request).first
		} catch {
			fatalError()
		}
	}
	
	func deleteCategory(category: CategoryEntity) {
		context.delete(category)
		saveContext()
	}
	
	func fetchDailyEntity(date: Date) -> DailyEntity? {
		let request = DailyEntity.fetchRequest()
		// TODO: - change predicate arguments
		//        request.predicate = NSPredicate(format: "date == %@", DateManager.convertToString(date: date))
		
		do {
			return try context.fetch(request).first
		} catch {
			fatalError()
		}
	}
	
	func fetchMonthlyEntity(date: Date) -> MonthlyEntity? {
		let request = MonthlyEntity.fetchRequest()
		// TODO: - change predicate arguments
		//        request.predicate = NSPredicate(format: "date == %@", DateManager.convertToString(date: date))
		
		do {
			return try context.fetch(request).first
		} catch {
			fatalError()
		}
	}
	
	func fetchAllHistoryEntities() -> [HistoryEntity] {
		let request = HistoryEntity.fetchRequest()
		
		do {
			return try context.fetch(request)
		} catch {
			fatalError()
		}
	}
	
	func fetchDailyHistoryEntities(at date: Date) -> [HistoryEntity] {
		guard let dailyEntity = fetchDailyEntity(date: date) else { return [] }
		
		return dailyEntity.historyEntities?.allObjects as? [HistoryEntity] ?? []
	}
	
	func addHistoryEntity(historyEntity: HistoryEntity) {
		if let dailyEntity = fetchDailyEntity(date: historyEntity.date!) {
			dailyEntity.addToHistoryEntities(historyEntity)
		} else {
			// TODO: - add entity when daily entity not exists
			
			// TODO: - add entity when monthly entity not exists
			
		}
		
		saveContext()
	}
	
	private func deleteEntity(_ entity: NSManagedObject) {
		context.delete(entity)
	}
	
}
