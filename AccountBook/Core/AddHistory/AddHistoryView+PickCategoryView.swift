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
                    ForEach(appState.allCategories.indices, id: \.self) { index in
                        if appState.allCategories[index].name != nil {
                            BaseText(appState.allCategories[index].name!, foregroundColor: Color.convertToColor(components: (appState.allCategories[index].red, appState.allCategories[index].green, appState.allCategories[index].blue, appState.allCategories[index].opacity)))
                        }
                    }
                    .onDelete(perform: appState.deleteCategory)
                } label: {
                    EmptyView()
                }
                .pickerStyle(.inline)
            }
        }
    }
}
