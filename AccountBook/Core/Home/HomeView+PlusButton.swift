//
//  HomeView+PlusButton.swift
//  AccountBook
//
//  Created by peo on 2022/08/22.
//

import SwiftUI

extension HomeView {
    struct PlusButton: View {
        @EnvironmentObject var appState: AppState
        @ObservedObject var observed: Observed
        
        var body: some View {
            Button("추가") {
                observed.showAddModal.toggle()
            }
            .sheet(isPresented: $observed.showAddModal) {
                NavigationView {
                    AddHistoryView(showAddModal: $observed.showAddModal)
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationTitle("추가하기")
                        .font(.body)
                }
            }
        }
    }
}
