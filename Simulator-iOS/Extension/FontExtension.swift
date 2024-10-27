//
//  FontExtension.swift
//  F1 Race Start Simulator
//
//  Created by Florian DAVID on 27/10/2024.
//

import SwiftUI

extension View {
    func F1Bold(size: Int) -> some View {
        self.font(Font.custom("Formula1-Display-Bold", size: CGFloat(size)))
    }
    
    func F1Regular(size: Int) -> some View {
        self.font(Font.custom("Formula1-Display-Regular", size: CGFloat(size)))
    }
}
