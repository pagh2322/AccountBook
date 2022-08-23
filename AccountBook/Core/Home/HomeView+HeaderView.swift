//
//  HomeView+HeaderView.swift
//  AccountBook
//
//  Created by peo on 2022/08/22.
//

import SwiftUI

extension HomeView {
    struct HeaderView: View {
        @Binding var showAnalysis: Bool
        @Binding var showCalendar: Bool
        
        @EnvironmentObject var appState: AppState
        
        var body: some View {
            VStack(alignment: .leading) {
                Text("이번 달 소비 금액")
                    .foregroundColor(.secondary)
                
                HStack(alignment: .firstTextBaseline, spacing: 0) {
                    Text(PriceManager.string(price: appState.monthlyTotalPrice))
                        .font(.largeTitle)
                    
                    Text("원")
                        .bold()
                        .foregroundColor(.secondary)
                        .padding(.leading, 4)
                }
                .padding(.bottom, 2)
                
                HStack {
                    Button(DateManager.string(date: appState.currentDate)) {
                        
                    }
                    
                    Spacer()
                    Button {
                        withAnimation {
                            showCalendar.toggle()
                        }
                    } label: {
                        Image(systemName: "chevron.up")
                            .rotationEffect(.init(degrees: (showCalendar ? 0 : 180)))
                    }
                }
                
//                Button("분석 보기") {
//                    withAnimation {
//                        showAnalysis.toggle()
//                    }
//                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
