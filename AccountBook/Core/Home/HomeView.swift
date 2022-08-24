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
    
    let categories = ["내역", "통계"]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        MonthlyTotalPriceView()
                        
                        PickerView()
                            .padding(.vertical, 12)
                        
                        Button(DateManager.string(date: appState.currentDate)) {
                            
                        }
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        AbstractView()
                            .padding(.top, 12)
                    }
                    .padding(.horizontal, 12)
                    .padding(.top)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .modifier(Toolbar())
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
