//
//  TapZoneView.swift
//  F1 Race Start Simulator
//
//  Created by Florian DAVID on 27/10/2024.
//

import SwiftUI

struct TapZoneView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var actionOnTap: () -> Void
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(colorScheme == .dark ? .black : .white)
                .ignoresSafeArea()
                .onTapGesture {
                    self.actionOnTap()
                }
        }
    }
}

#Preview {
    TapZoneView(actionOnTap: {
        print("OK !")
    })
}
