//
//  CDivider.swift
//  AccountBook
//
//  Created by peo on 2022/08/22.
//

import SwiftUI

struct CDivider: View {
    var height: CGFloat = 8
    
    var body: some View {
        Rectangle()
            .fill(.gray.opacity(0.2))
            .frame(height: height)
    }
}
