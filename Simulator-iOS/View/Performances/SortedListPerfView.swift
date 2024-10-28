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
    @State private var selectedOrder = "Best times"
    @State private var isAsc = true
    @State private var perfs: [ReactionTime] = []
    
    var body: some View {
        VStack {
            if perfs.count > 0 {
                HStack {
                    Text("Sort by")
                    Menu(selectedOrder.lowercased()) {
                        Button("Best times", action: { selectedOrder = "Best times" })
                        Button("Date", action: { selectedOrder = "Date" })
                    }
                    
                    Button {
                        isAsc.toggle()
                        getPerfs()
                    } label: {
                        HStack(alignment: .firstTextBaseline, spacing: 5) {
                            Image(systemName: isAsc ? "arrow.up" : "arrow.down")
                            Text(isAsc ? "Ascending" : "Descending")
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
                ButtonGameView(text: "play", action: { self.presentationMode.wrappedValue.dismiss() })
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
        if selectedOrder == "Best times" {
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
