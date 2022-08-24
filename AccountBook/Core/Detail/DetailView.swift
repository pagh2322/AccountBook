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
            
            Text("내역 추가")
                .foregroundColor(.accentColor)
                .background(NavigationLink(isActive: $willAddHistory) {
                    AddHistoryView(willAddHistory: $willAddHistory)
                } label: {
                    EmptyView()
                })
            
        }
        .listStyle(.sidebar)
        .modifier(Toolbar(
            DateManager.string(date: appState.currentDate, stringStyle: .all),
            showDetailModal: $showDetailModal
        ))
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(showDetailModal: .constant(true))
    }
}
