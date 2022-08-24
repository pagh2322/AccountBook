//
//  DetailView+HistoryListView.swift
//  AccountBook
//
//  Created by peo on 2022/08/24.
//

import SwiftUI

extension DetailView {
    @ViewBuilder
    func HistoryListView() -> some View {
        ExpenditureHistoryListView()
        
        IncomeHistoryListView()
    }
    
    @ViewBuilder
    func ExpenditureHistoryListView() -> some View {
        Section {
            ForEach(appState.dailyExpenditureHistories) { history in
                HistoryListItem(history: history)
            }
            .onDelete { indexSet in
                appState.deleteHistory(at: indexSet, type: .expenditure)
            }
        } header: {
            Text("지출")
        }
    }
    
    @ViewBuilder
    func IncomeHistoryListView() -> some View {
        Section {
            ForEach(appState.dailyIncomeHistories) { history in
                HistoryListItem(history: history)
            }
            .onDelete { indexSet in
                appState.deleteHistory(at: indexSet, type: .income)
            }
        } header: {
            Text("수입")
        }
    }
}
