//
//  BottomNavbarView.swift
//  F1 Race Start Simulator
//
//  Created by Florian DAVID on 27/10/2024.
//

import SwiftUI

struct BottomNavbarView: View {
    @Binding var startPlay: Bool
    
    var body: some View {
        if !startPlay {
            HStack {
                NavigationLink(destination: EmptyView()) {
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                }
                
                Spacer()
                
                Button {
                    startPlay.toggle()
                } label: {
                    Text("START")
                        .F1Regular(size: 16)
                        .padding(.init(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .background(.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Spacer()
                
                NavigationLink(destination: EmptyView()) {
                    Image(systemName: "person.circle.fill")
                        .imageScale(.large)
                }
            }
            .padding(.horizontal)
            .frame(height: 50)
        }
    }
}

#Preview {
    BottomNavbarView(startPlay: .constant(false))
}
