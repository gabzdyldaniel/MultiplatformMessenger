//
//  StringExtension.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 13.05.2022.
//

import Foundation

public extension String {

    static let empty = ""
    static let space = " "

    static func uuidString(length: Int? = nil) -> String {
        if let lengthUnwrapped = length {
            var textValue = ""
            while textValue.count < lengthUnwrapped {
                textValue += UUID().uuidString
            }
            return String(textValue.prefix(lengthUnwrapped))
        } else {
            return UUID().uuidString
        }
    }

    var trimmed: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
