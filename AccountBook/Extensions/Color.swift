//
//  Color.swift
//  AccountBook
//
//  Created by peo on 2022/08/23.
//

import SwiftUI

extension Color {
    static let cBlack = Color("CBlack")
    static let cBlue = Color("CBlue")
    static let cRed = Color("CRed")
    
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, opacity: CGFloat) {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var o: CGFloat = 0
        
        guard UIColor(self).getRed(&r, green: &g, blue: &b, alpha: &o) else {
            // You can handle the failure here as you want
            return (0, 0, 0, 0)
        }
        
        return (r, g, b, o)
    }
    
    static func convertToColor(components: (red: Double, green: Double, blue: Double, opacity: Double)) -> Color {
        return Color(red: components.red, green: components.green, blue: components.blue, opacity: components.opacity)
    }
}
