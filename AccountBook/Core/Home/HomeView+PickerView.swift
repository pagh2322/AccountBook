//
//  HomeView+PickerView.swift
//  AccountBook
//
//  Created by peo on 2022/08/22.
//

import SwiftUI

extension HomeView {
    @ViewBuilder
    func PickerView() -> some View {
        Picker("", selection: $observed.currentIndex) {
            ForEach(categories.indices, id: \.self) {
                Text(categories[$0])
            }
        }
        .pickerStyle(.segmented)
    }
}
