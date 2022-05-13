//
//  DicoMqttMessage.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 13.05.2022.
//

import Foundation
import ObjectMapper

open class DicoMqttMessage: ApiObject {

    public var type: String!
    public var data: ApiObject?

    public required init?(map: Map) {}

    open func mapping(map: Map) {
        type <- map["type"]
        data <- (map["data"], AnyApiObjectTransformType())
    }

    public init() {
        self.type = ""
    }
}
