//
//  AddHistoryView+PickCategoryView.swift
//  AccountBook
//
//  Created by peo on 2022/08/24.
//

import SwiftUI

extension AddHistoryView {
    @ViewBuilder
    func PickCategoryView() -> some View {
        Form {
            Section {
                Picker(selection: $observed.category) {
                    ForEach(appState.allCategories.indices, id: \.self) {
                        BaseText(appState.allCategories[$0])
                    }
                } label: {
                    EmptyView()
                }
                .pickerStyle(.inline)
            }
        }
    }
}
