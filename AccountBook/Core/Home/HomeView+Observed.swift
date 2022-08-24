//
//  HomeView+Observed.swift
//  AccountBook
//
//  Created by peo on 2022/08/22.
//

import SwiftUI

extension HomeView {
    final class Observed: ObservableObject {
        @Published var showDetailModal = false
        @Published var currentIndex = 0
    }
}
