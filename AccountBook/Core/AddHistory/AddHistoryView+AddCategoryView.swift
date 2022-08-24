//
//  AddHistoryView+AddCategoryView.swift
//  AccountBook
//
//  Created by peo on 2022/08/24.
//

import SwiftUI

extension AddHistoryView {
    @ViewBuilder
    func AddCategoryView() -> some View {
        Form {
            Section {
                HStack {
                    BaseText("이름")
                    TextField("내용을 입력하세요", text: $observed.newCategoryText)
                        .padding(.leading, 8)
                }
            }
            
            Button("완료") {
                appState.allCategories.append(observed.newCategoryText)
                observed.newCategoryText = ""
                willAddCategory.toggle()
            }
        }
    }
}
