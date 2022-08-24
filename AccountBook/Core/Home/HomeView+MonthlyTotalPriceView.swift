//
//  HomeView+MonthlyTotalPriceView.swift
//  AccountBook
//
//  Created by peo on 2022/08/24.
//

import SwiftUI

extension HomeView {
    @ViewBuilder
    func MonthlyTotalPriceView() -> some View {
        HStack(spacing: 12) {
            TotalPriceView(historyType: .expenditure, price: appState.monthlyTotalPrice)
            TotalPriceView(historyType: .income, price: appState.monthlyTotalPrice)
        }
    }
    
    @ViewBuilder
    func TotalPriceView(historyType: HistoryType, price: Double) -> some View {
        CardView(backgroundColor: historyType == .income ? Color.cBlue : Color.cRed) {
            VStack(alignment: .leading) {
                BaseText(historyType == .income ? "이번 달 수입" : "이번 달 지출", foregroundColor: .white.opacity(0.6))

                HStack(alignment: .lastTextBaseline, spacing: 0) {
                    BaseText(PriceManager.string(price: price), foregroundColor: .white)
                        .font(.title)

                    BaseText("원", foregroundColor: .white.opacity(0.6))
                        .padding(.leading, 4)
                }
            }
        }
    }
}
