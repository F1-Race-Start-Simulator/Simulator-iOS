//
//  ContentView.swift
//  Simulator-iOS
//
//  Created by Florian DAVID on 16/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var startPlay = false
    
    var body: some View {
        NavigationView {
            VStack {
                GameView(buttonHidden: $startPlay)
                BottomNavbarView(startPlay: $startPlay)
            }
            .navigationBarTitle("Home", displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AppViewModel())
}
