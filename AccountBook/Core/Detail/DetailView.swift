//
//  DetailView.swift
//  AccountBook
//
//  Created by peo on 2022/08/24.
//

import SwiftUI

struct DetailView: View {
    @Binding var showDetailModal: Bool
    
    @State var willAddHistory = false
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        List {
            TotalInfoView()
            
            HistoryListView()
        }
        .listStyle(.sidebar)
        .modifier(Toolbar(
            DateManager.string(date: appState.currentDate, stringStyle: .all),
            showDetailModal: $showDetailModal,
            willAddHistory: $willAddHistory
        ))
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(showDetailModal: .constant(true))
    }
}
