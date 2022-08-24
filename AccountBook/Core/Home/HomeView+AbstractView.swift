//
//  HomeView+AbstractView.swift
//  AccountBook
//
//  Created by peo on 2022/08/24.
//

import SwiftUI

extension HomeView {
    @ViewBuilder
    func AbstractView() -> some View {
        Group {
            if observed.currentIndex == 0 {
                FSCalendarView(showDetailModal: $observed.showDetailModal)
                    .sheet(isPresented: $observed.showDetailModal) {
                        NavigationView {
                            DetailView(showDetailModal: $observed.showDetailModal)
                                .navigationBarTitleDisplayMode(.inline)
                        }
                    }
                    .frame(height: 400)
            } else {
                VStack {
                    Text("Donut Chart")
                    
                    Text("소비  지출")
                }
            }
        }
    }
}
