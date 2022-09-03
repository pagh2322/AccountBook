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
                if observed.isEditingCategories {
                    ForEach(appState.allCategories.indices, id: \.self) { index in
                        if appState.allCategories[index].name != nil {
                            BaseText(appState.allCategories[index].name!, foregroundColor: Color.convertToColor(components: (appState.allCategories[index].red, appState.allCategories[index].green, appState.allCategories[index].blue, appState.allCategories[index].opacity)))
                        }
                    }
                    .onDelete(perform: appState.deleteCategory)
                } else {
                    Picker(selection: $observed.category) {
                        ForEach(appState.allCategories.indices, id: \.self) { index in
                            if appState.allCategories[index].name != nil {
                                BaseText(
                                    appState.allCategories[index].name!,
                                    foregroundColor: Color.convertToColor(components: (appState.allCategories[index].red, appState.allCategories[index].green, appState.allCategories[index].blue, appState.allCategories[index].opacity)))
                            }
                        }
                    } label: {
                        EmptyView()
                    }
                    .pickerStyle(.inline)
                }
            }
            
            if !observed.isEditingCategories {
                Section {
                    Button("카테고리 추가") {
                        willAddCategory = true
                    }
                    .background(NavigationLink(isActive: $willAddCategory) {
                        AddCategoryView()
                    } label: {
                        EmptyView()
                    })
                }
            }
        }
    }
}
