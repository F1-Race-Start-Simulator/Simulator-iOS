//
//  LightsView.swift
//  F1 Race Start Simulator
//
//  Created by Florian DAVID on 27/10/2024.
//

import SwiftUI
import AVKit

struct LightsView: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var lightsOn: [Bool]
    @Binding var buttonHidden: Bool
    @Binding var isChrono: Bool
    @Binding var jumpStart: Bool
    
    @State private var timers: [DispatchWorkItem] = []
    
    var body: some View {
        HStack {
            ForEach(lightsOn.indices, id: \.self) { i in
                LightItemView(isOn: $lightsOn[i])
            }
        }
        .background(
            Rectangle()
                .foregroundColor(colorScheme == .dark ? Color(hex: "#38383E") : .black)
                .frame(height: 15)
        )
        .padding()
        .onChange(of: buttonHidden, perform: { value in
            if value && !jumpStart {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: startLights)
            }
        })
        .onChange(of: jumpStart, perform: { value in
            if value {
                resetLights()
            }
        })
    }
    
    func startLights() {
        cancelTimers()
        
        for (i, _) in lightsOn.enumerated() {
            let timer = DispatchWorkItem {
                lightsOn[i] = true
            }
            timers.append(timer)
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i), execute: timer)
        }
        
        let time = Double(lightsOn.count) + Double.random(in: 0.0..<2.0)
        let resetTimer = DispatchWorkItem {
            lightsOn = Array(repeating: false, count: 5)
            isChrono = true
        }
        timers.append(resetTimer)
        DispatchQueue.main.asyncAfter(deadline: .now() + time, execute: resetTimer)
    }
    
    func cancelTimers() {
        for timer in timers {
            timer.cancel()
        }
        timers.removeAll()
    }
    
    func resetLights() {
        cancelTimers()
        lightsOn = Array(repeating: false, count: 5)
        isChrono = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            buttonHidden = false
            jumpStart = false
        }
    }
}

#Preview() {
    LightsView(
        lightsOn: .constant(Array.init(repeating: false, count: 5)),
        buttonHidden: .constant(false),
        isChrono: .constant(false),
        jumpStart: .constant(false)
    )
}
