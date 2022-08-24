//
//  AddHistoryView.swift
//  AccountBook
//
//  Created by peo on 2022/08/23.
//

import SwiftUI

struct AddHistoryView: View {
    @EnvironmentObject var appState: AppState
    
    @Binding var willAddHistory: Bool
    
    @State var willAddCategory = false
    
    @StateObject var observed = Observed()
    
    var body: some View {
        List {
            HistoryInfoView()
            
            Section {
                Button("내역 저장") {
                    let historyModel = HistoryModel(date: appState.currentDate, price: Double(observed.priceText) ?? 0, content: observed.titleText, category: appState.allCategories[observed.category])
                    appState.monthlyHistoryModels.append(historyModel)
                    appState.todayHistoryModels.append(historyModel)
                    willAddHistory.toggle()
                }
            }
        }
    }
}

struct AddHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddHistoryView(willAddHistory: .constant(true))
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
