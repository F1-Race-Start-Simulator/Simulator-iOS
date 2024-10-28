//
//  DateFormatter.swift
//  F1 Race Start Simulator
//
//  Created by Florian DAVID on 28/10/2024.
//

import Foundation

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        dateFormatter.timeZone = TimeZone.current
        
        return dateFormatter.string(from: self)
    }
}
