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
                .padding(.horizontal)
                .frame(maxWidth: 700)
                .frame(height: device == .pad ? 400 : 250)
                
                VStack {
                    if let index = perfs.indices.min(by: { perfs[$0].time < perfs[$1].time }) {
                        let bestPerf = perfs[index]
                            Text("Best performance - \(String(format: "%.3f", bestPerf.time)) s")
                                .F1Bold(size: 20)
                                .foregroundColor(.purple)
                            
                            Text("(\(bestPerf.date.toString()) - Attempt n°\(index + 1))")
                                .F1Bold(size: 16)
                                .foregroundColor(.gray)
                    }
                    
                    let avgTime = appVM.averagePerformance()
                    Text("Average performance - \(String(format: "%.3f", avgTime)) s")
                        .F1Bold(size: 20)
                        .foregroundColor(.green)
                        .padding(.top)
                }
            }
        }
    }
}

#Preview {
    PerformancesEvolView()
        .environmentObject(AppViewModel())
}
