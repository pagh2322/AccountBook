//
//  HistoryModel.swift
//  AccountBook
//
//  Created by peo on 2022/08/21.
//

import Foundation

typealias HistoryModels = [HistoryModel]

struct HistoryModel: Identifiable {
    var id: UUID
    var date: Date
    var price: Double
    var content: String
    var category: String
    var type: Int16
    
    init() {
        id = UUID()
        date = Date()
        price = 0
        content = ""
        category = ""
        type = 0
    }
}

enum HistoryType: Int16, CaseIterable {
    case expenditure = 0
    case income = 1
    
    var text: String {
        switch self {
        case .expenditure: return "지출"
        case .income: return "수입"
        }
    }
}
