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
        
        var body: some View {
            VStack(alignment: .leading) {
                Text("2022년 6월")
                Text("324,000원")
                    .font(.title)
                
                Button("분석 보기") {
                    withAnimation {
                        showAnalysis.toggle()
                    }
                    
                }
                RoundedRectangle(cornerRadius: 15)
                    .frame(height: showAnalysis ? 110 : 0)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
