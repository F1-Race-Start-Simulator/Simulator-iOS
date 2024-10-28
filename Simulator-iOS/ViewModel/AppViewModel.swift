//
//  AppViewModel.swift
//  F1 Race Start Simulator
//
//  Created by Florian DAVID on 27/10/2024.
//

import Foundation

@MainActor
class AppViewModel: ObservableObject {
    @Published var performances: [ReactionTime] = []
    
    init() {
        performances = getUserPerformances()
    }
    
    /**
     * Returns all reaction time performances (who stored persistently)
     */
    private func getUserPerformances() -> [ReactionTime] {
        if let storedData = UserDefaults.standard.data(forKey: "perfs"),
           let decodedPerson = try? JSONDecoder().decode([ReactionTime].self, from: storedData) {
            return decodedPerson
        }
        return []
    }
    
    /**
     * Tells whether the performance given in parameter is the new best
     * Returns true if so, false otherwise
     */
    func isBestPerformance(_ performance: Double) -> Bool {
        if let bestPerfBefore = performances.min(by: { $0.time < $1.time }) {
            return performance < bestPerfBefore.time
        } else {
            return true
        }
    }
    
    /**
     * Adds new performance and saves it persistently
     */
    func addPerformance(_ performance: Double) {
        performances.append(ReactionTime(time: performance))
        savePerformances()
    }
    
    /**
     * Returns the user's average reaction time
     */
    func averagePerformance() -> Double {
        return performances.reduce(0) { $0 + $1.time } / Double(performances.count)
    }
    
    /**
     * Persistently saves all reaction times
     */
    private func savePerformances() {
        if let encodedData = try? JSONEncoder().encode(performances) {
            DispatchQueue.main.async {
                UserDefaults.standard.set(encodedData, forKey: "perfs")
            }
        }
    }
}
