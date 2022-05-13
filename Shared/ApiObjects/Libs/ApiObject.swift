//
//  ApiObject.swift
//
//
//  Created by Roman Manďák on 28.02.18.
//

import Foundation
import ObjectMapper

public typealias CustomFieldsType = [String: Any]

/**
 Protocol which should implement each ApiObject.
 */
public protocol ApiObject: Mappable {
    func getCustomValue<T: Any>(key: String) -> T?
    func getValue<T: Any>(key: String) -> T?
}

public extension ApiObject {
    /**
     Method can return custom field from ApiObject.

     - Note: The method can return ApiObject

     - Parameter key: The key where can be multiple keys separated by dot.
     - Returns: A optional *GeneritType*.

     ### Usage Example: ###
     ````
     let stringCustomValue: String? = apiObject.getCustomValue(key: "customString")
     ````
     */
    func getCustomValue<T: Any>(key: String) -> T? {
        let customKey = "@customFields.\(key)"
        return self.getValue(key: customKey)
    }
    /**
     Method can return value for key.

     ### Usage Example: ###
     ````
     let stringValue: String? = apiObject.getValue(key: "key.key1.key2")
     ````
     - Parameter key: The key where can be multiple keys separated by dot.
     - Returns: A optional *GeneritType*.

     */
    func getValue<T: Any>(key: String) -> T? {
        let baseType: T? =  self.toJSON().getValue(key: key)
        return baseType
    }

    func getValueAsString(key: String) -> String {
        return self.toJSON().getValueAsString(key: key)
    }

    var duplicated: Self? {
        return Self.init(JSON: toJSON())
    }

    static var className: String {
        return "\(self)"
    }

    func toJSON(includeNilValues: Bool) -> [String: Any] {
        var mutableObject = self
        let map = Map(mappingType: .toJSON, JSON: [:], context: nil, shouldIncludeNilValues: includeNilValues)
        mutableObject.mapping(map: map)
        return map.JSON
    }
}
