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
                    observed.historyModel.date = appState.currentDate
                    observed.historyModel.content = observed.titleText
                    observed.historyModel.price = Double(observed.priceText)!
                    observed.historyModel.category = appState.allCategories[observed.category]
                    observed.historyModel.type = observed.historyType.rawValue
                    appState.insertHistory(hisotryModel: observed.historyModel)
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
