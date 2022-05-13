//
//  MQTTClient.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 13.05.2022.
//

import Foundation
import ObjectMapper

open class B2aDicoMQTTClient: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var uuid: String!

    public required init?(map: Map) {}

    open func mapping(map: Map) {
        uuid <- map["uuid"]
        API_TYPE <- map["@type"]
        expandable <- map["@expandable"]
    }

    public init() {
        self.uuid = ""
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\MQTT\\Module\\Client\\API\\Client",
            "swift": "B2aDicoMQTTClient",
            "typescript": "B2aDicoMQTTClient"
        ]
        self.expandable = [:]
    }

}
