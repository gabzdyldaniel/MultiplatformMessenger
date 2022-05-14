//
//  B2aDicoUserUserUserExtension.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 14.05.2022.
//

import Foundation

public extension B2aDicoUserUserUser {
    var fullName: String {
        var parts: [String] = []

        if let name = name {
            parts.append(name)
        }
        if let surname = surname {
            parts.append(surname)
        }

        return parts.joined(separator: .space)
    }

    var initials: String {
        guard let nameFirstCharacter = name?.first,
              let surnameFirstCharacter = surname?.first else {
            return "N/A"
        }

        return "\(nameFirstCharacter)\(surnameFirstCharacter)"
    }
}
