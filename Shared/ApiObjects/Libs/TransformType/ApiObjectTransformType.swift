//
//  ApiObjectTransformType.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 13.05.2022.
//

import Foundation
import ObjectMapper

public extension StringProtocol where Index == String.Index {
    func index<T: StringProtocol>(of string: T, options: String.CompareOptions = []) -> Index? {
        return range(of: string, options: options)?.lowerBound
    }
}

extension String {
    static let namespaceSuffix = "Dico"
    public func getNamespace() -> String? {
        if self.contains("AbraSdk") {
            return "AbraSdkSwiftPod"
        }
        guard let startIndexNamespace = self.index(of: Self.namespaceSuffix) else { return nil }
        let namespaceString = String(self.prefix(upTo: startIndexNamespace))
        if namespaceString.isEmpty {
             return nil
        }
        return "\(namespaceString)PodDico"
    }
}

public protocol BOInitable: AnyObject {
    func setupBOProperty()
}

public extension BaseMappable where Self: BOInitable {

    func setupCustomProperty() {}
}

open class ApiObjectTransformType<T: ApiObject>: TransformType {
    public typealias Object = T
    public typealias JSON = [String: Any]

    public init() {}

    open func transformFromJSON(_ value: Any?) -> Object? {
        guard let dict = value as? [String: Any] else { return nil }

        guard let objectTypeDict: [String: String] = dict.getValue(key: "@type"), objectTypeDict.keys.contains("swift"), let className = objectTypeDict["swift"],
            let namespace = className.getNamespace(),
            let specificObject = (NSClassFromString("\(namespace).\(className)") as? Mappable.Type)?.init(JSON: dict) else {
                let object = T(JSON: dict)
                (object as? BOInitable)?.setupBOProperty()
                return object
        }

        let object: T?

        if let objectAsGenericType = specificObject as? T {
            object = objectAsGenericType
        } else {
            object = (NSClassFromString("\(namespace).\(className)") as? T.Type)?.init(JSON: dict)
        }
        (object as? BOInitable)?.setupBOProperty()
        return object
    }

    open func transformToJSON(_ value: Object?) -> JSON? {
        guard let object = value else { return nil }
        return object.toJSON()
    }
}
