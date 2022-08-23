//
//  HomeView+Observed.swift
//  AccountBook
//
//  Created by peo on 2022/08/22.
//

import SwiftUI

extension HomeView {
    final class Observed: ObservableObject {
        @Published var showCalendar = true
        @Published var showAddModal = false
        @Published var showAnalysis = false
        @Published var currentIndex = 0
    }
}
