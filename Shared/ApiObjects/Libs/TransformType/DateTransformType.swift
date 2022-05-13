//
//  DateTransformType.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 13.05.2022.
//

import Foundation
import ObjectMapper

open class DateTransformType: TransformType {
    public typealias Object = Date
    public typealias JSON = String

    public init() {}

    open func transformFromJSON(_ value: Any?) -> Object? {
        guard let stringDate = value as? String else {
            return nil
        }

        return Date(from: stringDate)
    }

    open func transformToJSON(_ value: Object?) -> JSON? {
        guard let value = value else {
            return nil
        }

        return value.getStringDate(timeZone: TimeZone.utcTimeZone)
    }
}
