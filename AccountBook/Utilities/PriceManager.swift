//
//  PriceManager.swift
//  AccountBook
//
//  Created by peo on 2022/08/23.
//

import Foundation

final class PriceManager {
    static func string(price: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(for: price)!
    }
}
