//
//  GameView.swift
//  F1 Race Start Simulator
//
//  Created by Florian DAVID on 27/10/2024.
//

import SwiftUI
import AVFoundation

struct GameView: View {
    @State private var lightsAppear = Array(repeating: false, count: 5)
    @Binding var buttonHidden: Bool
    @State private var isChrono = false
    @State private var jumpStart = false
    
    var body: some View {
        VStack {
            LightsView(
                lightsOn: $lightsAppear,
                buttonHidden: $buttonHidden,
                isChrono: $isChrono,
                jumpStart: $jumpStart
            )
            
            TimerView(
                startPlay: $buttonHidden,
                timerStarted: $isChrono,
                jumpStart: $jumpStart
            )
            
            TapZoneView(actionOnTap: {
                if lightsAppear.allSatisfy({ !$0 }) && !jumpStart {
                    isChrono = false
                } else {
                    jumpStart = true
                }
            })
        }
    }
}

#Preview {
    GameView(buttonHidden: Binding.constant(false))
}
