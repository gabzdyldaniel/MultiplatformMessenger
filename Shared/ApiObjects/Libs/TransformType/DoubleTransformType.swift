//
//  DoubleTransformType.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 13.05.2022.
//

import Foundation
import ObjectMapper

open class DoubleTransformType: TransformType {
    public typealias Object = Double
    public typealias JSON = Double

    public init() {}

    open func transformFromJSON(_ value: Any?) -> Object? {
        if let nonDecimal = value as? Int {
            return Double(nonDecimal)
        } else if let str = value as? String {
            return Double(str)
        } else {
            return value as? Double
        }
    }

    open func transformToJSON(_ value: Object?) -> JSON? {
        return value
    }
}
