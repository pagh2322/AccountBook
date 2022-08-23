//
//  HistoryModel.swift
//  AccountBook
//
//  Created by peo on 2022/08/21.
//

import Foundation

struct HistoryModel: Identifiable {
    var id = UUID()
    var date: Date
    var price: Double
    var content: String
    var category: String
    var isExpenditure: Bool
}
