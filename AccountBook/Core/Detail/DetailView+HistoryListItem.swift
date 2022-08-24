//
//  DetailView+HistoryListItem.swift
//  AccountBook
//
//  Created by peo on 2022/08/24.
//

import SwiftUI

extension DetailView {
    @ViewBuilder
    func HistoryListItem(history: History) -> some View {
        if history.category != nil &&
           history.content != nil {
            HStack {
                BaseText(history.category!, foregroundColor: .white, weight: .semibold)
                    .font(.caption2)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 6)
                    .background(RoundedRectangle(cornerRadius: 4).fill(Color.cRed))
                
                BaseText(history.content!, weight: .semibold)
                    .padding(.leading, 8)
                
                Spacer()
                BaseText("\(PriceManager.string(price: history.price))원")
            }
        }
    }
}
