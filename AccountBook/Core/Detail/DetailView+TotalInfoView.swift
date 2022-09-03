//
//  DetailView+TotalInfoView.swift
//  AccountBook
//
//  Created by peo on 2022/08/24.
//

import SwiftUI

extension DetailView {
    @ViewBuilder
    func TotalInfoView() -> some View {
        VStack(alignment: .leading) {
            BaseText("총 \(appState.dailyHistoriesNumber)건")
                .font(.headline)
            
            Divider()
            
            VStack(alignment: .leading, spacing: 0) {
                PriceTextView(price: appState.dailyExpenditurePrice)
                
                PriceBarView(type: .expenditure, width: $observed.expenditureWidth)
            }
            
            VStack(alignment: .leading, spacing: 0) {
                PriceTextView(price: appState.dailyIncomePrice)
                
                PriceBarView(type: .income, width: $observed.incomeWidth)
            }
        }
        .onAppear {
//            if appState.dailyIncomePrice > 0 &&
//               appState.dailyExpenditurePrice > 0 {
//                if appState.dailyExpenditurePrice > appState.dailyIncomePrice {
//                    observed.expenditureWidth = observed.maxWidth
//                    observed.incomeWidth = observed.maxWidth * (appState.dailyIncomePrice / appState.dailyExpenditurePrice)
//                } else {
//                    observed.incomeWidth = observed.maxWidth
//                    observed.expenditureWidth = observed.maxWidth * (appState.dailyExpenditurePrice / appState.dailyIncomePrice)
//                }
//            }
        }
    }
    
    @ViewBuilder
    func PriceTextView(price: Double) -> some View {
        HStack(alignment: .lastTextBaseline, spacing: 0) {
            BaseText("\(PriceManager.string(price: price))")
                .font(.title)

            BaseText("원", foregroundColor: .secondary)
                .padding(.leading, 4)
        }
    }
    
    @ViewBuilder
    func PriceBarView(type: HistoryType, width: Binding<CGFloat>) -> some View {
        BaseText(type.text, foregroundColor: .white, weight: .semibold)
            .font(.footnote)
            .frame(maxWidth: width.wrappedValue, alignment: .leading)
            .padding(.leading, 8)
            .padding(.vertical, 6)
            .background(type == .expenditure ? Color.cRed : Color.cBlue)
            .cornerRadius(4)
            .padding(.top, 4)
    }
}
