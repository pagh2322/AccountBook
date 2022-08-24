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
        Section {
            ForEach(appState.todayHistoryModels) { historyModel in
                HistoryListItem(historyModel: historyModel)
            }
        } header: {
            Text("지출")
        }
        
        Section {
            ForEach(appState.todayHistoryModels) { historyModel in
                HistoryListItem(historyModel: historyModel)
            }
        } header: {
            Text("수입")
        }
    }
}
