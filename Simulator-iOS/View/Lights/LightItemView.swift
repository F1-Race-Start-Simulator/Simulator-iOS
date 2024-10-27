//
//  LightItemView.swift
//  F1 Race Start Simulator
//
//  Created by Florian DAVID on 27/10/2024.
//

import SwiftUI
import AVKit

struct LightItemView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var audioLight: AVAudioPlayer?
    @Binding var isOn: Bool
    
    var body: some View {
        ZStack {
            let lightOut: Color = colorScheme == .dark ? .black : Color(hex: "#38383E")
            
            VStack {
                Circle()
                    .foregroundColor(lightOut)
                    .scaledToFit()
                Circle()
                    .foregroundColor(lightOut)
                    .scaledToFit()
                Circle()
                    .foregroundColor(isOn ? .red : lightOut)
                    .scaledToFit()
                Circle()
                    .foregroundColor(isOn ? .red : lightOut)
                    .scaledToFit()
            }
            .padding(10)
            .background(
                Rectangle()
                    .foregroundColor(colorScheme == .dark ? Color(hex: "#38383E") : .black)
                    .cornerRadius(20)
            )
            .onChange(of: isOn, perform: { val in
                if val {
                    playLightSound()
                }
            })
        }
    }
    
    func playLightSound() {
        guard let audioPath = Bundle.main.path(forResource: "bip_step", ofType: "mp3") else {
            print("Audio file not found")
            return
        }
        
        do {
            audioLight = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            audioLight?.prepareToPlay()
        } catch {
            print("Error initializing audio player: \(error.localizedDescription)")
        }
        
        if let player = audioLight {
            player.play()
        }
    }
}

#Preview {
    LightItemView(isOn: .constant(false))
}
