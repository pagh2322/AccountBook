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
                
                ColorPicker("색상", selection: $observed.selectedColor)
            }
            
            Button("완료") {
                var categoryModel = CategoryModel()
                categoryModel.name = observed.newCategoryText
                categoryModel.red = observed.selectedColor.components.red
                categoryModel.green = observed.selectedColor.components.green
                categoryModel.blue = observed.selectedColor.components.blue
                categoryModel.opacity = observed.selectedColor.components.opacity
                
                appState.insertCategory(categoryModel: categoryModel)
                
                observed.newCategoryText = ""
                observed.selectedColor = .cBlack
                willAddCategory.toggle()
            }
        }
    }
}
