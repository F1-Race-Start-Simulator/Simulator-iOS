//
//  BottomNavbarView.swift
//  F1 Race Start Simulator
//
//  Created by Florian DAVID on 27/10/2024.
//

import SwiftUI

struct BottomNavbarView: View {
    @Binding var startPlay: Bool
    
    var body: some View {
        if !startPlay {
            HStack {
                NavigationLink(destination: AllPerformancesView()) {
                    Image(systemName: "trophy.fill")
                        .imageScale(.large)
                }
                
                Spacer()
                ButtonGameView(text: "start_button", action: { startPlay.toggle() })
                
                Spacer()
                Button(action: { exit(0) }) {
                    Image(systemName: "pip.exit")
                        .imageScale(.large)
                }
            }
            .padding(.horizontal)
            .frame(height: 50)
        }
    }
}

#Preview {
    BottomNavbarView(startPlay: .constant(false))
        .environmentObject(AppViewModel())
}
