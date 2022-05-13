//
//  DateExtension.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 13.05.2022.
//

import Foundation

public extension Date {
    static var formatter = DateFormatter()
    static let defaultLocale = Locale(identifier: "en_US_POSIX")
    static var defaultDateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    static var defaultTimeFormat = "'T'HH:mm:ss.SSSZ"

    init?(from dateString: String?, format: String = defaultDateFormat, locale: Locale = Date.defaultLocale, timeZone: TimeZone = TimeZone.utcTimeZone) {
        guard let str = dateString else { return nil }
        let formatter = Date.formatter
        formatter.dateFormat = format
        formatter.locale = locale
        formatter.timeZone = timeZone
        guard let date = formatter.date(from: str) else { return nil }
        self.init(timeInterval: 0, since: date)
    }

    func getStringDate(_ format: String = defaultDateFormat, timeZone: TimeZone = .autoupdatingCurrent, locale: Locale = Date.defaultLocale) -> String {
        let dateStringFormatter = Date.formatter
        dateStringFormatter.dateFormat = format
        dateStringFormatter.timeZone = timeZone
        dateStringFormatter.locale = locale
        return dateStringFormatter.string(from: self as Date)
    }
}
