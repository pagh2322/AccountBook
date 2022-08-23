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
                Text(historyModel.category)
                    .font(.callout)
                    .padding(4)
                    .padding(.horizontal, 4)
                    .background(RoundedRectangle(cornerRadius: 4).fill(Color.orange))
                
                Text(historyModel.content)
                    .fontWeight(.semibold)
                    .padding(.leading, 8)
                
                Spacer()
                Text("\(PriceManager.string(price: historyModel.price))원")
            }
        }
    }
}
