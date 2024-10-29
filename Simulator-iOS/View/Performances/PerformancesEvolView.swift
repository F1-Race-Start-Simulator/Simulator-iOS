//
//  PerformancesEvolView.swift
//  F1 Race Start Simulator
//
//  Created by Florian DAVID on 28/10/2024.
//

import SwiftUI
import Charts

struct PerformancesEvolView: View {
    @EnvironmentObject var appVM: AppViewModel
    @State private var device = UIDevice.current.userInterfaceIdiom
    
    var body: some View {
        VStack(spacing: 30) {
            let perfs = appVM.performances
            if perfs.count > 1 {
                Chart(perfs.indices, id: \.self) {
                    LineMark(
                        x: .value("x", $0),
                        y: .value("y", max(-(perfs[$0].time), -1))
                    )
                    .lineStyle(StrokeStyle(lineWidth: 5))
                    .foregroundStyle(.accent)
                }
                .chartXAxis {
                    AxisMarks(position: .bottom) {
                        AxisGridLine().foregroundStyle(Color.primary)
                    }
                }
                .chartYScale(domain: -1...0)
                .chartYAxis {
                    AxisMarks(position: .leading, values: AxisMarkValues.stride(by: device == .pad ? 0.1 : 0.2)) { value in
                        AxisGridLine().foregroundStyle(Color.primary)
                        AxisValueLabel {
                            if let doubleValue = value.as(Double.self) {
                                Text(String(format: "%.3f", doubleValue).replacingOccurrences(of: "-", with: ""))
                                    .F1Regular(size: 14)
                                    .foregroundColor(Color.primary)
                                    .padding(.trailing, 5)
                            }
                        }
                    }
                }
                .frame(maxWidth: 700)
                .frame(height: device == .pad ? 400 : 250)
                
                VStack {
                    if let index = perfs.indices.min(by: { perfs[$0].time < perfs[$1].time }) {
                        let bestPerf = perfs[index]
                            Text("best_perf_text_\(String(format: "%.3f", bestPerf.time))")
                                .F1Bold(size: 20)
                                .foregroundColor(.purple)
                            
                            Text("best_perf_attempt_text_\(bestPerf.date.toString())_\(index + 1, specifier: "%d")")
                                .F1Bold(size: 16)
                                .foregroundColor(.gray)
                    }
                    
                    let avgTime = appVM.averagePerformance()
                    Text("avg_perf_text_\(String(format: "%.3f", avgTime))")
                        .F1Bold(size: 20)
                        .foregroundColor(.green)
                        .padding(.top)
                }
                .multilineTextAlignment(.center)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    PerformancesEvolView()
        .environmentObject(AppViewModel())
}
