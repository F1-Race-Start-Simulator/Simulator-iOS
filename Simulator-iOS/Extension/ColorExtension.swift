//
//  ColorExtension.swift
//  F1 Race Start Simulator
//
//  Created by Florian DAVID on 27/10/2024.
//

import SwiftUI

extension Color {
    init(hex: String?) {
        if let hex = hex {
            var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
            cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
            var rgb: UInt64 = 0
            
            Scanner(string: cleanHexCode).scanHexInt64(&rgb)
            
            let redValue = Double((rgb >> 16) & 0xFF) / 255.0
            let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
            let blueValue = Double(rgb & 0xFF) / 255.0
            self.init(red: redValue, green: greenValue, blue: blueValue)
        } else {
            self.init(uiColor: UIColor(Color.accentColor))
        }
    }
}
