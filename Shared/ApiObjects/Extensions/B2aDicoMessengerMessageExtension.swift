//
//  B2aDicoMessengerMessageExtension.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 14.05.2022.
//

import Foundation

extension B2aDicoMessengerMessage: Equatable {
    public static func == (lhs: B2aDicoMessengerMessage, rhs: B2aDicoMessengerMessage) -> Bool {
        return lhs.id == rhs.id
    }
}
