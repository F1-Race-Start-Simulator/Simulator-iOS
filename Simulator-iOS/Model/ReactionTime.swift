//
//  ReactionTime.swift
//  F1 Race Start Simulator
//
//  Created by Florian DAVID on 28/10/2024.
//

import Foundation

struct ReactionTime: Codable {
    var time: Double // In seconds
    var date: Date = Date.now
}
