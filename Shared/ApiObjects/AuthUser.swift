//
//  AuthUser.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 13.05.2022.
//

import Foundation
import ObjectMapper

open class B2aDicoAuthUserLoggedUser: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var id: Int!
    open var name: String!
    open var surname: String!
    open var email: String!
    open var apiKey: String!
    open var mqttClient: B2aDicoMQTTClient?

    public required init?(map: Map) {}

    open func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        surname <- map["surname"]
        email <- map["email"]
        apiKey <- map["apiKey"]
        mqttClient <- (map["mqttClient"], ApiObjectTransformType())
        API_TYPE <- map["@type"]
        expandable <- map["@expandable"]
    }

    public init() {
        self.id = 0
        self.name = ""
        self.surname = ""
        self.email = ""
        self.apiKey = ""
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\Auth\\Module\\User\\API\\LoggedUser",
            "swift": "B2aDicoAuthUserLoggedUser",
            "typescript": "B2aDicoAuthUserLoggedUser"
        ]
        self.expandable = [:]
    }

}
