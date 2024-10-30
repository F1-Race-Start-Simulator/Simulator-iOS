//
//  DateFormatter.swift
//  F1 Race Start Simulator
//
//  Created by Florian DAVID on 28/10/2024.
//

import Foundation

/**
 * Extension of Date who allows to convert a date to a string.
 * The date format depends of a localized string.
 */
extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = NSLocalizedString("date_format", comment: "")
        dateFormatter.timeZone = TimeZone.current
        
        return dateFormatter.string(from: self)
    }
}
