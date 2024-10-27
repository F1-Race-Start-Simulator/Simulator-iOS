//
//  Simulator_iOSApp.swift
//  Simulator-iOS
//
//  Created by Florian DAVID on 16/10/2024.
//

import SwiftUI

@main
struct Simulator_iOSApp: App {
    init() {
        setFontsForBars()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    func setFontsForBars() {
        let attributesBold: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Formula1-Display-Bold", size: 18)!,
            .textEffect: NSAttributedString.TextEffectStyle.letterpressStyle,
        ]
        
        let attributesReg: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Formula1-Display-Regular", size: 14)!,
            .textEffect: NSAttributedString.TextEffectStyle.letterpressStyle
        ]
        
        UIBarButtonItem.appearance().setTitleTextAttributes(attributesReg, for: .normal)
        UINavigationBar.appearance().titleTextAttributes = attributesBold
    }
}
