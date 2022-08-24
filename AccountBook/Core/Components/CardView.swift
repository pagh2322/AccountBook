//
//  CardView.swift
//  AccountBook
//
//  Created by peo on 2022/08/24.
//

import SwiftUI

struct CardView<Content: View>: View {
    var content: Content
    var backgroundColor: Color
    
    init(backgroundColor: Color, @ViewBuilder content: () -> Content) {
        self.backgroundColor = backgroundColor
        self.content = content()
    }
    
    var body: some View {
        content
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(backgroundColor)
            .cornerRadius(8)
    }
}
