//
//  HomeView+PlusButton.swift
//  AccountBook
//
//  Created by peo on 2022/08/22.
//

import SwiftUI

extension HomeView {
    struct PlusButton: View {
        @ObservedObject var observed: Observed
        
        var body: some View {
            Button {
                observed.showAddModal.toggle()
            } label: {
                Image(systemName: "plus")
            }
            .sheet(isPresented: $observed.showAddModal) {
                AddHistoryView(showAddModal: $observed.showAddModal)
            }
        }
    }
}
