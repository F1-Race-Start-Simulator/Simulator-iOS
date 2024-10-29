//
//  ListPerformancesView.swift
//  F1 Race Start Simulator
//
//  Created by Florian DAVID on 28/10/2024.
//

import SwiftUI

struct ListPerformancesView: View {
    @Binding var perfs: [ReactionTime]
    @Binding var order: String
    
    var body: some View {
        List {
            ForEach(perfs.indices, id: \.self) { i in
                let perf = perfs[i]
                HStack {
                    if order == "best_time_index" {
                        Text(String(format: "%.2d", i + 1))
                            .F1Bold(size: 32)
                            .foregroundColor(.accent)
                            .frame(width: 60)
                        
                        VStack(alignment: .leading) {
                            Text("\(String(format: "%.3f", perf.time)) s")
                                .F1Regular(size: 20)
                            
                            Text(perf.date.toString())
                                .F1Regular(size: 14)
                                .foregroundColor(.gray)
                        }
                    } else {
                        HStack {
                            Text("\(String(format: "%.3f", perf.time)) s")
                                .F1Regular(size: 20)
                            
                            Spacer()
                            Text(perf.date.toString())
                                .F1Regular(size: 14)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    ListPerformancesView(perfs: .constant([]), order: .constant("best_time_index"))
}
