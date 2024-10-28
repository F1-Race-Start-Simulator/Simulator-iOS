//
//  AllPerformancesView.swift
//  F1 Race Start Simulator
//
//  Created by Florian DAVID on 28/10/2024.
//

import SwiftUI

struct AllPerformancesView: View {
    @EnvironmentObject var appVM: AppViewModel
    @State private var catView = "rank"
    
    var body: some View {
        VStack {
            if appVM.performances.count > 1 {
                Picker("cat", selection: $catView) {
                    Text("Ranking").tag("rank")
                    Text("Evolution").tag("evol")
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
            }

            switch catView {
                case "rank": SortedListPerfView()
                case "evol":
                    Spacer()
                    PerformancesEvolView()
                default: EmptyView()
            }
            
            Spacer()
        }
        .navigationBarTitle(
            "Your performances - \(catView == "rank" ? "Ranking" : "Evolution")",
            displayMode: .inline
        )
    }
}

#Preview {
    AllPerformancesView()
        .environmentObject(AppViewModel())
}
