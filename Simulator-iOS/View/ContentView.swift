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
            .navigationBarTitle("home_name", displayMode: .inline)
            .navigationBarHidden(true)
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    ContentView()
        .environmentObject(AppViewModel())
        .environment(\.locale, .init(identifier: "de"))
}
