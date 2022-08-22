//
//  HomeView+HistoryListItem.swift
//  AccountBook
//
//  Created by peo on 2022/08/22.
//

import SwiftUI

extension HomeView {
    struct HistoryListItem: View {
        var historyModel: HistoryModel
        
        var body: some View {
            HStack {
                Circle()
                    .fill(.orange)
                    .frame(width: 42, height: 42)
                
                VStack(alignment: .leading) {
                    Text(historyModel.content)
                        .fontWeight(.semibold)
                    Text(historyModel.category)
                        .font(.callout)
                }
                .padding(.leading, 8)
                
                Spacer()
                Text("\(historyModel.price)원")
            }
        }
    }
}
