//
//  AnyApiObjectTransformType.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 13.05.2022.
//

import Foundation
import ObjectMapper

open class AnyApiObjectTransformType: TransformType {
    public typealias Object = ApiObject
    public typealias JSON = [String: Any]

    public init() {}

    open func transformFromJSON(_ value: Any?) -> Object? {
        guard let dict = value as? [String: Any] else { return nil }

        guard let specificObject = dict.apiObject else {
            return nil
        }

        (specificObject as? BOInitable)?.setupBOProperty()
        return specificObject
    }

    open func transformToJSON(_ value: Object?) -> JSON? {
        guard let object = value else { return nil }
        return object.toJSON()
    }
}
