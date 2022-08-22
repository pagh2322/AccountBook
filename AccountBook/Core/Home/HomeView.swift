//
//  HomeView.swift
//  AccountBook
//
//  Created by peo on 2022/08/21.
//

import SwiftUI

struct HomeView: View {
    @StateObject var observed = Observed()
    
    let categories = ["수입", "지출"]
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HeaderView(showAnalysis: $observed.showAnalysis)
                    .padding([.top, .horizontal])
                    .padding(.horizontal)
                    
                    CDivider()
                    
                    FSCalendarView()
                        .frame(
                            width: UIScreen.main.bounds.width - 20,
                            height: 320
                        )
                        .padding()
                    
                    Divider()
                    
                    VStack {
                        PlusButton(observed: observed)

                        HistoryListItem(historyModel: HistoryModel(date: Date(), price: 1000, content: "모네 커피", category: "커피", isExpenditure: true))
                        .padding()
                    }
                    .padding()
                    Spacer()
                }
                
                Picker("", selection: $observed.currentIndex) {
                    ForEach(categories.indices, id: \.self) {
                        Text(categories[$0])
                    }
                }
                .pickerStyle(.segmented)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding()
            }
            .navigationBarHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
