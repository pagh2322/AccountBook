//
//  DetailView+Toolbar.swift
//  AccountBook
//
//  Created by peo on 2022/08/24.
//

import SwiftUI

extension DetailView {
    struct Toolbar: ViewModifier {
        let title: String
        @Binding var showDetailModal: Bool
        
        init(_ title: String, showDetailModal: Binding<Bool>) {
            self.title = title
            self._showDetailModal = showDetailModal
        }
        
        func body(content: Content) -> some View {
            content
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            showDetailModal.toggle()
                        } label: {
                            Text("닫기")
                        }
                    }
                    
                    ToolbarItem(placement: .principal) {
                        Text(title)
                    }
                    
                    // Edit Button
                }
        }
    }
}
