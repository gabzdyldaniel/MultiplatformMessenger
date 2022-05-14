//
//  GroupedMessage.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 14.05.2022.
//

import Foundation

struct GroupedMessages: Equatable {
    var date: String
    var messages: [B2aDicoMessengerMessage]

    static func == (lhs: GroupedMessages, rhs: GroupedMessages) -> Bool {
        return lhs.date == rhs.date
    }
}
