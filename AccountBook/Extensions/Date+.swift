//
//  Date+.swift
//  AccountBook
//
//  Created by peo on 2022/08/25.
//

import Foundation

extension Date {
	func isSameDay(with date: Date) -> Bool {
		Calendar.current.isDate(self, inSameDayAs: date)
	}
}
