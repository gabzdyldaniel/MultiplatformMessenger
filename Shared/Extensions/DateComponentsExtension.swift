//
//  DateComponentsExtension.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 14.05.2022.
//

import Foundation

extension DateComponents {
    func toString() -> String {
        guard let day = day,
              let month = month,
              let year = year else {
            return "N/A"
        }

        return "\(day).\(month).\(year)"
    }
}
