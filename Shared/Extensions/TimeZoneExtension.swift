//
//  TimeZoneExtension.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 13.05.2022.
//

import Foundation

public extension TimeZone {
    static var utcTimeZone: TimeZone = TimeZone(abbreviation: "UTC") ?? TimeZone.current
}
