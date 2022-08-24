//
//  DateManager.swift
//  AccountBook
//
//  Created by peo on 2022/08/23.
//

import Foundation

final class DateManager {
    enum StringStyle {
        case year
        case yearAndMonth
        case all
        
        var dateFormat: String {
            switch self {
            case .year: return "yyyy년"
            case .yearAndMonth: return "yyyy년 M월"
            case .all: return "yyyy년 M월 d일"
            }
        }
    }
    
    static func string(date: Date, stringStyle: StringStyle = .yearAndMonth) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = stringStyle.dateFormat
        return dateFormatter.string(from: date)
    }
    
    static func convertToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMM"
        return dateFormatter.string(from: date)
    }
}
