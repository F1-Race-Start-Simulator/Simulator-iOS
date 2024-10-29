//
//  SortedListPerfView.swift
//  F1 Race Start Simulator
//
//  Created by Florian DAVID on 28/10/2024.
//

import SwiftUI

struct SortedListPerfView: View {
    @EnvironmentObject var appVM: AppViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedOrder = "best_time_index"
    @State private var isAsc = true
    @State private var perfs: [ReactionTime] = []
    
    var body: some View {
        VStack {
            if perfs.count > 0 {
                HStack {
                    Text("sort_by")
                    Menu(NSLocalizedString(selectedOrder, comment: "").lowercased()) {
                        Button("best_time_index", action: { selectedOrder = "best_time_index" })
                        Button("date_index", action: { selectedOrder = "date_index" })
                    }
                    
                    Button {
                        isAsc.toggle()
                        getPerfs()
                    } label: {
                        HStack(alignment: .firstTextBaseline, spacing: 5) {
                            Image(systemName: isAsc ? "arrow.up" : "arrow.down")
                            Text(isAsc ? "A-Z / 0-9" : "Z-A / 9-0")
                        }
                    }
                    .padding(.leading, 5)
                }
                .F1Regular(size: 16)
                .padding(.vertical)

                ListPerformancesView(perfs: $perfs, order: $selectedOrder)
            } else {
                Spacer()
                Text("None performance listed")
                    .F1Bold(size: 20)
                    .padding(10)
                
                ButtonGameView(text: "play_game_button", action: {
                    self.presentationMode.wrappedValue.dismiss()
                })
                Spacer()
            }
        }
        .onAppear(perform: getPerfs)
        .onChange(of: selectedOrder, perform: { _ in
            getPerfs()
        })
    }
    
    func getPerfs() {
        let allPerfs = appVM.performances
        if selectedOrder == "best_time_index" {
            perfs = allPerfs.sorted(by: { isAsc ? $0.time < $1.time : $0.time > $1.time })
        } else {
            perfs = allPerfs.sorted(by: { isAsc ? $0.date < $1.date : $0.date > $1.date })
        }
    }
}

#Preview {
    SortedListPerfView()
        .environmentObject(AppViewModel())
}
