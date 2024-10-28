//
//  ButtonGameView.swift
//  F1 Race Start Simulator
//
//  Created by Florian DAVID on 28/10/2024.
//

import SwiftUI

struct ButtonGameView: View {
    @State var text: String
    @State var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text.uppercased())
                .F1Regular(size: 16)
                .padding(.init(top: 10, leading: 20, bottom: 10, trailing: 20))
                .background(.green)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}

#Preview {
    ButtonGameView(text: "print", action: { print("print") })
}
