//
//  BaseText.swift
//  AccountBook
//
//  Created by peo on 2022/08/24.
//

import SwiftUI

struct BaseText: View {
    var text: String
    var foregroundColor: Color
    var weight: Font.Weight?
    
    init(_ text: String, foregroundColor: Color = .cBlack, weight: Font.Weight? = nil) {
        self.text = text
        self.foregroundColor = foregroundColor
        self.weight = weight
    }
    
    var body: some View {
        Text(text)
            .foregroundColor(foregroundColor)
            .fontWeight(weight)
    }
}
