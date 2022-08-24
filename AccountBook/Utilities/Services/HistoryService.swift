//
//  HistoryService.swift
//  AccountBook
//
//  Created by peo on 2022/08/24.
//

import Foundation

final class HistoryService {
    static func fetchMonthlyHistories(date: Date) -> [History] {
        return CoreDataManager.shared.fetchMonthlyHistories(date: date)
    }
    
    static func fetchDailyHistories(date: Date, type: HistoryType) -> [History] {
        let monthlyHistories = fetchMonthlyHistories(date: date)
        return monthlyHistories.filter {
            $0.date!.isSameDay(with: date) &&
            $0.type == type.rawValue
        }
    }
    
    static func saveHistory(_ historyModel: HistoryModel) {
        let history = convertToHistory(historyModel: historyModel)
        
        saveHistory(history)
    }
    
    static func saveHistory(_ history: History) {
        CoreDataManager.shared.saveHistory(history: history)
    }
    
    static func deleteHistory(history: History) {
        CoreDataManager.shared.deleteHistory(history: history)
    }
    
    static func fetchTotalPrice(_ histories: [History]) -> Double {
        return histories.reduce(0) { $0 + $1.price }
    }
    
    static func fetchTotalPrice(_ histories: [History], type: HistoryType) -> Double {
        return histories
            .filter { $0.type == type.rawValue }
            .reduce(0) { $0 + $1.price }
    }
    
    static func convertToHistory(historyModel: HistoryModel) -> History {
        let history = History(context: CoreDataManager.shared.context)
        history.category = historyModel.category
        history.content = historyModel.content
        history.date = historyModel.date
        history.id = historyModel.id
        history.price = historyModel.price
        history.type = historyModel.type
        
        return history
    }
    
    static func fetchDailyPrice(date: Date, type: HistoryType) -> Double {
        let dailyHistories = fetchDailyHistories(date: date, type: type)
        return fetchTotalPrice(dailyHistories)
    }
}
