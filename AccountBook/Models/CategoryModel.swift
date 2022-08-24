//
//  CategoryModel.swift
//  AccountBook
//
//  Created by peo on 2022/08/25.
//

import Foundation

struct CategoryModel: Identifiable {
    var id: UUID
    var name: String
    var red: Double
    var green: Double
    var blue: Double
    var opacity: Double
    
    init() {
        id = UUID()
        name = ""
        red = 0
        green = 0
        blue = 0
        opacity = 0
    }
}
