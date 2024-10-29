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
                    Text("rank_pick_label").tag("rank")
                    Text("evol_pick_label").tag("evol")
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
        .navigationBarTitle("perfs_name", displayMode: .inline)
    }
}

#Preview {
    AllPerformancesView()
        .environmentObject(AppViewModel())
}
