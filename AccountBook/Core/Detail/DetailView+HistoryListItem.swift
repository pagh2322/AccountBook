//
//  DetailView+HistoryListItem.swift
//  AccountBook
//
//  Created by peo on 2022/08/24.
//

import SwiftUI

extension DetailView {
    @ViewBuilder
    func HistoryListItem(historyModel: HistoryModel) -> some View {
        HStack {
            BaseText(historyModel.category, foregroundColor: .white, weight: .semibold)
                .font(.callout)
                .padding(.horizontal, 8)
                .padding(.vertical, 6)
                .background(RoundedRectangle(cornerRadius: 4).fill(Color.cRed))
            
            BaseText(historyModel.content, weight: .semibold)
                .padding(.leading, 8)
            
            Spacer()
            BaseText("\(PriceManager.string(price: historyModel.price))원")
        }
    }
}
