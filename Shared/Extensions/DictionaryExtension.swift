//
//  DictionaryExtension.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 13.05.2022.
//

import Foundation
import ObjectMapper

public enum DictionaryKeyError: Error {
    case missingKey
    case missingValue
    case other(message: String)

    public var stringValue: String {
        switch self {
        case .missingValue:
            return "N/A"
        case .missingKey:
            return ""
        default:
            return ""
        }
    }
}

public enum DictionaryKeyResult<Success, Failure> where Failure: Error {
    case success(Success)
    case failure(Failure)

}

public extension Dictionary {
    mutating func merge(_ dict: [Key: Value]) {
        for (k, v) in dict {
            updateValue(v, forKey: k)
        }
    }

    var apiObjectType: String? {
        guard let selfDict = self as? [String: Any] else { return nil }
        if let type = selfDict["@type"] as? String {
            return type
        } else if let typeDict = selfDict["@type"] as? [String: String], let swiftType = typeDict["swift"] {
            return swiftType
        }
        return nil
    }
}

public extension Dictionary where Key == String, Value == Any {
    var withStringValues: [String: Any] {
        // filter nil values and convert the rest to String type
        return self.mapValues({ value in
            switch value {
            case let text as String:
                return text
            case let intValue as Int:
                return "\(intValue)"
            case let doubleValue as Double:
                return "\(doubleValue)"
            case let boolValue as Bool:
                return (boolValue ? "yes" : "no")
            case let dict as [String: Any]:
                return dict.withStringValues
            default:
                return value
            }
        })
    }

    func getValue<T: Any>(key: String, separator: String = ".") -> T? {
        let fullPath = key.components(separatedBy: separator)
        var pathObj: Any? = self
        for pathComponent in fullPath {
            pathObj = (pathObj as? [String: Any])?[pathComponent]
        }

        if let type = T.self as? Mappable.Type, let data =  pathObj as? [String: Any] {
            return type.init(JSON: data) as? T
        }
        return pathObj as? T
    }

    func getValueAsString(key: String, separator: String = ".") -> String {
        let result: DictionaryKeyResult<String, DictionaryKeyError> = self.getValueAsString(key: key, separator: separator)
        switch result {
        case .success(let value):
            return value
        case .failure(let error):
            return error.stringValue
        }
    }

    func getValue<T: Any>(key: String, separator: String = ".") -> DictionaryKeyResult<T, DictionaryKeyError> {
        let fullPath = key.components(separatedBy: separator)
        var pathObj: Any? = self
        for pathComponent in fullPath {
            pathObj = (pathObj as? [String: Any])?[pathComponent]
            if pathObj == nil {
                return .failure(.missingKey)
            }
        }

        if let data = pathObj as? T {
            return .success(data)
        } else {
            return .failure(.missingValue)
        }
    }

    func getValueAsString(key: String, separator: String = ".") -> DictionaryKeyResult<String, DictionaryKeyError> {
        var stringValue = ""
        let valueResult: DictionaryKeyResult<Any, DictionaryKeyError> = self.getValue(key: key, separator: separator)
        switch valueResult {
        case .success(let value):
            switch value as Any {
            case let text as String:
                stringValue = text
            case let intValue as Int:
                stringValue = "\(intValue)"
            case let doubleValue as Double:
                stringValue = "\(doubleValue)"
            case let boolValue as Bool:
                stringValue = boolValue ? "yes" : "no"
            default:
                return .failure(.missingValue)
            }
            return .success(stringValue)
        case .failure(let error):
            return .failure(error)
        }
    }
}

extension Dictionary {
    func deepMerge(_ secondDictionary: [String: Any]) -> [String: Any] {
        guard let dictionary = self as? [String: Any] else {
            return [:]
        }
        var result = dictionary
        for (secondKey, secondValue) in secondDictionary {
            if let firstValue = result[secondKey] as? [String: Any], let secondValue = secondValue as? [String: Any] {
                result[secondKey] = firstValue.deepMerge(secondValue)
            } else {
                result[secondKey] = secondValue
            }
        }
        return result
    }
}

public extension Dictionary where Key == String, Value: Any {
    var apiObject: ApiObject? {
        guard let className = self.apiObjectType else { return nil }
        if className == "collection" {
            return ApiCollection(JSON: self)
        }
        guard let specificObject = (NSClassFromString("MultiplatformMessenger.\(className)") as? ApiObject.Type)?.init(JSON: self) else {
            return nil
        }
        return specificObject
    }
}
