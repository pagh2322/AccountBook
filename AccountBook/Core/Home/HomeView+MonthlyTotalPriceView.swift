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
        VStack(spacing: 0) {
            SumPriceView()
            
            HStack(spacing: 12) {
                TotalPriceView(historyType: .expenditure, price: appState.monthlyExpenditurePrice)
                TotalPriceView(historyType: .income, price: appState.monthlyIncomePrice)
            }
            .padding(.top, 4)
        }
    }
    
    @ViewBuilder
    func SumPriceView() -> some View {
        VStack(alignment: .leading) {
            BaseText("이번 달 잔액", foregroundColor: .secondary)
            
            HStack(alignment: .lastTextBaseline, spacing: 0) {
                BaseText(PriceManager.string(price: appState.monthlyIncomePrice - appState.monthlyExpenditurePrice), foregroundColor: .cBlack)
                    .font(.title)

                BaseText("원", foregroundColor: .secondary)
                    .padding(.leading, 4)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
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
