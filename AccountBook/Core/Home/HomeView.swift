//
//  HomeView.swift
//  AccountBook
//
//  Created by peo on 2022/08/21.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appState: AppState
    
    @StateObject var observed = Observed()
    
    let categories = ["수입", "지출"]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                VStack(spacing: 0) {
                    HeaderView(showAnalysis: $observed.showAnalysis, showCalendar: $observed.showCalendar)
                        .padding(.top)
                        .padding(.leading, 10)
                    
                    FSCalendarView()
                        .frame(height: observed.showCalendar ? 312 : 0)
                        .padding(.top, observed.showCalendar ? 12 : 0)
                }
                .padding(.horizontal)
                
                Form {
                    NavigationLink {
                        Text("분석")
                    } label: {
                        Text("분석")
                    }
                    
                    Section {
                        ForEach(appState.todayHistoryModels) { historyModel in
                            HistoryListItem(historyModel: historyModel)
                        }
                    } header: {
                        HStack {
                            Text("내역")
                            Spacer()
                            PlusButton(observed: observed)
                        }
                    }
                }
            }
            .background(Color.init(UIColor.systemGroupedBackground).ignoresSafeArea())
            .navigationBarHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//                Picker("", selection: $observed.currentIndex) {
//                    ForEach(categories.indices, id: \.self) {
//                        Text(categories[$0])
//                    }
//                }
//                .pickerStyle(.segmented)
//                .frame(maxHeight: .infinity, alignment: .bottom)
//                .padding()
