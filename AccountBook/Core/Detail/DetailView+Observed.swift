//
//  DetailView+Observed.swift
//  AccountBook
//
//  Created by peo on 2022/08/24.
//

import SwiftUI

extension DetailView {
    final class Observed: ObservableObject {
        @Published var expenditureWidth: CGFloat = .infinity
        @Published var incomeWidth: CGFloat = .infinity
        
        @Published var maxWidth: CGFloat = 0
    }
}
