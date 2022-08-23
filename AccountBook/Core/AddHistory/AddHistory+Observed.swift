//
//  AddHistory+Observed.swift
//  AccountBook
//
//  Created by peo on 2022/08/23.
//

import SwiftUI

extension AddHistoryView {
    final class Observed: ObservableObject {
        @Published var titleText = ""
        @Published var priceText = ""
        @Published var category = 0
    }
}
