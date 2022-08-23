//
//  AppState.swift
//  AccountBook
//
//  Created by peo on 2022/08/23.
//

import SwiftUI
import Combine

final class AppState: ObservableObject {
    @Published var monthlyHistoryModels: [HistoryModel] = []
    @Published var monthlyTotalPrice: Double = 0
    @Published var currentDate = Date()
    @Published var todayHistoryModels: [HistoryModel] = []
    
    var refreshCalendar = PassthroughSubject<Bool, Never>()
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        $monthlyHistoryModels
            .receive(on: DispatchQueue.main)
            .sink { [weak self] historyModels in
                self?.monthlyTotalPrice = 0
                historyModels.forEach { self?.monthlyTotalPrice += $0.price }
                self?.refreshCalendar.send(true)
            }
            .store(in: &cancellables)
        
        $currentDate
            .receive(on: DispatchQueue.main)
            .sink { [weak self] date in
                self?.todayHistoryModels = []
                self?.monthlyHistoryModels.forEach { historyModel in
                    if Calendar.current.isDate(historyModel.date, inSameDayAs: date) {
                        self?.todayHistoryModels.append(historyModel)
                    }
                }
            }
            .store(in: &cancellables)
    }
    
    func calendarCurrentPageDidChange(date: Date) {
        
    }
}
