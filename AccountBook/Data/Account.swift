//
//  Account.swift
//  AccountBook
//
//  Created by peo on 2022/12/28.
//

import Foundation

struct Account {
	
	let id = UUID()
	let name: String
	let income: Double
	let excome: Double
	
}

extension Account {
	static let dummy = [
		Account(name: "혬스터", income: 20000, excome: 100000),
		Account(name: "혬글이", income: 30000, excome: 24000),
		Account(name: "혬댕이", income: 0, excome: 24000),
		Account(name: "혬몬", income: 230, excome: 0),
		Account(name: "혬혬이", income: 0, excome: 0)]
}
