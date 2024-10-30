//
//  TimerView.swift
//  F1 Race Start Simulator
//
//  Created by Florian DAVID on 27/10/2024.
//

import SwiftUI

struct TimerView: View {
    @EnvironmentObject var appVM: AppViewModel
    @State private var counter: Double = 0.0
    @State private var timer: Timer?
    @Binding var startPlay: Bool
    @Binding var timerStarted: Bool
    @Binding var jumpStart: Bool
    
    var body: some View {
        VStack {
            Text(jumpStart ? NSLocalizedString("jump_start", comment: "").uppercased()
                           : String(format: "%.3f", counter))
            .F1Bold(size: jumpStart ? 36 : 48)
                .foregroundColor(jumpStart ? .accent : .primary)
            
            if timer == nil && counter > 0 && appVM.isBestPerformance(counter) {
                Label("best_perf_new", systemImage: "crown.fill")
                    .F1Regular(size: 16)
                    .foregroundColor(.gold)
            }
        }
        .multilineTextAlignment(.center)
        .padding()
        .onChange(of: timerStarted, perform: { value in
            if value && !jumpStart {
                startTimer()
            } else {
                stopTimer()
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    resetTimer()
                    startPlay = false
                    jumpStart = false
                }
            }
        })
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { _ in
            counter += 0.001
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        counter += 0
        timer = nil
    }
    
    func resetTimer() {
        if timer == nil {
            stopTimer()
            if !jumpStart { appVM.addPerformance(counter) }
            counter = 0.0
        }
    }
}

#Preview {
    TimerView(
        startPlay: .constant(true),
        timerStarted: .constant(false),
        jumpStart: .constant(false)
    )
    .environmentObject(AppViewModel())
}
