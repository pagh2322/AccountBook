//
//  AddHistoryView.swift
//  AccountBook
//
//  Created by peo on 2022/08/23.
//

import SwiftUI

struct AddHistoryView: View {
    @Binding var showAddModal: Bool
    
    var body: some View {
        Button("저장하기") {
            showAddModal.toggle()
        }
    }
}

struct AddHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        AddHistoryView(showAddModal: .constant(true))
    }
}
