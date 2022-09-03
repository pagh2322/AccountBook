//
//  AppState.swift
//  AccountBook
//
//  Created by peo on 2022/08/23.
//

import SwiftUI
import Combine

final class AppState: ObservableObject {
    @Published var monthlyHistories = HistoryService.fetchMonthlyHistories(date: Date())
    
    @Published var monthlyExpenditurePrice: Double = 0
    @Published var monthlyIncomePrice: Double = 0
    
    @Published var currentDate = Date()
    
    @Published var dailyHistoriesNumber = 0
    @Published var dailyExpenditureHistories: [History] = []
    @Published var dailyExpenditurePrice: Double = 0
    @Published var dailyIncomeHistories: [History] = []
    @Published var dailyIncomePrice: Double = 0
    
    var refreshCalendar = PassthroughSubject<Bool, Never>()
    var changeCalendarCurrentPage = PassthroughSubject<Date, Never>()
    var fetchMonthlyPrice = PassthroughSubject<[History], Never>()
    
    var cancellables = Set<AnyCancellable>()
    
    @Published var allCategories = CategoryService.fetchCategories()
    
    init() {
        $monthlyHistories
            .sink { [weak self] histories in
                self?.refreshCalendar.send(true)
            }
            .store(in: &cancellables)
        
        $currentDate
            .sink { [weak self] date in
                self?.dailyExpenditureHistories = HistoryService.fetchDailyHistories(date: date, type: .expenditure)
                self?.dailyIncomeHistories = HistoryService.fetchDailyHistories(date: date, type: .income)
                self?.dailyHistoriesNumber = (self?.dailyExpenditureHistories.count ?? 0) + (self?.dailyIncomeHistories.count ?? 0)
            }
            .store(in: &cancellables)
        
        $dailyExpenditureHistories
            .sink { [weak self] histories in
                self?.dailyExpenditurePrice = HistoryService.fetchTotalPrice(histories)
                self?.refreshCalendar.send(true)
            }
            .store(in: &cancellables)
        
        $dailyIncomeHistories
            .sink { [weak self] histories in
                self?.dailyIncomePrice = HistoryService.fetchTotalPrice(histories)
                self?.refreshCalendar.send(true)
            }
            .store(in: &cancellables)
        
        changeCalendarCurrentPage
            .sink { [weak self] date in
                guard let self = self else { return }
                self.monthlyHistories = HistoryService.fetchMonthlyHistories(date: date)
                self.fetchMonthlyPrice.send(self.monthlyHistories)
            }
            .store(in: &cancellables)
        
        fetchMonthlyPrice
            .sink { [weak self] histories in
                self?.monthlyExpenditurePrice = HistoryService.fetchTotalPrice(histories, type: .expenditure)
                self?.monthlyIncomePrice = HistoryService.fetchTotalPrice(histories, type: .income)
            }
            .store(in: &cancellables)
        fetchMonthlyPrice.send(monthlyHistories)
    }
    
    func insertHistory(hisotryModel: HistoryModel) {
        let history = HistoryService.convertToHistory(historyModel: hisotryModel)
        monthlyHistories.append(history)
        if history.type == 0 {
            dailyExpenditureHistories.append(history)
            monthlyExpenditurePrice += history.price
        } else {
            dailyIncomeHistories.append(history)
            monthlyIncomePrice += history.price
        }
        HistoryService.saveHistory(history)
    }
    
    func deleteHistory(at offsets: IndexSet, type: HistoryType) {
        switch type {
        case .expenditure:
            monthlyExpenditurePrice -= dailyExpenditureHistories[offsets.count - 1].price
            deleteHistory(history: dailyExpenditureHistories[offsets.count - 1])
            dailyExpenditureHistories.remove(atOffsets: offsets)
        case .income:
            monthlyIncomePrice -= dailyIncomeHistories[offsets.count - 1].price
            deleteHistory(history: dailyIncomeHistories[offsets.count - 1])
            dailyIncomeHistories.remove(atOffsets: offsets)
        }
    }
    
    func deleteHistory(history: History) {
        HistoryService.deleteHistory(history: history)
    }
    
    func insertCategory(categoryModel: CategoryModel) {
        let category = CategoryService.convertToCategory(categoryModel)
        allCategories.append(category)
        CategoryService.saveCategory()
    }
    
    func deleteCategory(at offsets: IndexSet) {
        CategoryService.deleteCategory(category: allCategories[offsets.count - 1])
        allCategories.remove(atOffsets: offsets)
    }
}
