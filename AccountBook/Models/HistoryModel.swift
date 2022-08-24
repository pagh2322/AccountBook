//
//  HistoryModel.swift
//  AccountBook
//
//  Created by peo on 2022/08/21.
//

import Foundation

typealias HistoryModels = [HistoryModel]

struct HistoryModel: Identifiable {
    var id = UUID()
    var date: Date
    var price: Double
    var content: String
    var category: String
}

enum HistoryType: CaseIterable {
    case expenditure
    case income
    
    var text: String {
        switch self {
        case .expenditure: return "지출"
        case .income: return "수입"
        }
    }
}
