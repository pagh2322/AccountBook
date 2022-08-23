//
//  AddHistoryView.swift
//  AccountBook
//
//  Created by peo on 2022/08/23.
//

import SwiftUI

struct AddHistoryView: View {
    @EnvironmentObject var appState: AppState
    @Binding var showAddModal: Bool
    
    @StateObject var observed = Observed()
    
    let categories = ["투자", "식비", "자기 계발"]
    
    var body: some View {
        Form {
            Section {
                List {
                    HStack {
                        Text("제목")
                        TextField("내용을 입력하세요", text: $observed.titleText)
                            .padding(.leading, 8)
                    }
                    HStack {
                        Text("금액")
                        TextField("내용을 입력하세요", text: $observed.priceText)
                            .keyboardType(.decimalPad)
                            .padding(.leading, 8)
                    }
                    Picker("카테고리", selection: $observed.category) {
                        ForEach(categories.indices, id: \.self) {
                            Text(categories[$0])
                        }
                    }
                }
            }
            Section {
                Button("저장하기") {
                    appState.monthlyHistoryModels.append(HistoryModel(date: appState.currentDate, price: Double(observed.priceText) ?? 0, content: observed.titleText, category: categories[observed.category], isExpenditure: true))
                    showAddModal.toggle()
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("취소") {
                    showAddModal.toggle()
                }
            }
        }
    }
}

struct AddHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddHistoryView(showAddModal: .constant(true))
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
