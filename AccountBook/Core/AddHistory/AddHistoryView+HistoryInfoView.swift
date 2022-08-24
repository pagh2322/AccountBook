//
//  AddHistoryView+HistoryInfoView.swift
//  AccountBook
//
//  Created by peo on 2022/08/24.
//

import SwiftUI

extension AddHistoryView {
    @ViewBuilder
    func HistoryInfoView() -> some View {
        Section {
            InfoInputView(title: "제목", text: $observed.titleText)
            
            InfoInputView(title: "금액", text: $observed.priceText)
                .keyboardType(.decimalPad)
            
            CategoryPickerView()
            
            HStack {
                BaseText("타입")
                
                Picker("", selection: $observed.historyType) {
                    ForEach(HistoryType.allCases, id: \.self) {
                        BaseText($0.text)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.leading, 8)
            }
        }
        .foregroundColor(.cBlack)
    }
    
    @ViewBuilder
    func InfoInputView(title: String, text: Binding<String>) -> some View {
        HStack {
            BaseText(title)
            TextField("내용을 입력하세요", text: text)
                .padding(.leading, 8)
        }
    }
    
    @ViewBuilder
    func CategoryPickerView() -> some View {
        NavigationLink {
            PickCategoryView()
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("추가") {
                            willAddCategory.toggle()
                        }
                        .background(NavigationLink(isActive: $willAddCategory) {
                            AddCategoryView()
                        } label: {
                            EmptyView()
                        })
                    }
                }
        } label: {
            HStack {
                BaseText("카테고리")
                
                Spacer()
                BaseText(appState.allCategories[observed.category], foregroundColor: .secondary)
            }
        }
    }
}
