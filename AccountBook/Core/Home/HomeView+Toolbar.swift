//
//  HomeView+Toolbar.swift
//  AccountBook
//
//  Created by peo on 2022/08/24.
//

import SwiftUI

extension HomeView {
    struct Toolbar: ViewModifier {
        func body(content: Content) -> some View {
            content
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            
                        } label: {
                            Image(systemName: "list.bullet.rectangle.portrait.fill")
                        }
                    }
                }
        }
    }
}
