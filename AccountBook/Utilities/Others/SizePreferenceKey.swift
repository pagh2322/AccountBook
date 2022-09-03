//
//  SizePreferenceKey.swift
//  AccountBook
//
//  Created by peo on 2022/08/25.
//

import SwiftUI

struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}
