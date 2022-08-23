//
//  DateManager.swift
//  AccountBook
//
//  Created by peo on 2022/08/23.
//

import Foundation

final class DateManager {
    static func string(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 M월"
        return dateFormatter.string(from: date)
    }
}
