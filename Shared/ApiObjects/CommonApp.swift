//
//  CommonApp.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 13.05.2022.
//

import Foundation
import ObjectMapper

open class B2aDicoCommonAppApp: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var id: Int?
    open var name: String!
    open var code: String!
    open var apiKey: String?
    open var parentApp: B2aDicoCommonAppApp?

    public required init?(map: Map) {}

    open func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        code <- map["code"]
        apiKey <- map["apiKey"]
        parentApp <- (map["parentApp"], ApiObjectTransformType())
        API_TYPE <- map["@type"]
        expandable <- map["@expandable"]
    }

    public init() {
        self.name = ""
        self.code = ""
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\Common\\Module\\App\\API\\App",
            "swift": "B2aDicoCommonAppApp",
            "typescript": "B2aDicoCommonAppApp"
        ]
        self.expandable = [:]
    }

}

open class B2aDicoCommonAppPackage: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var id: Int?
    open var uuid: String?
    open var app: B2aDicoCommonAppApp?
    open var code: String!
    open var title: String!

    public required init?(map: Map) {}

    open func mapping(map: Map) {
        id <- map["id"]
        uuid <- map["uuid"]
        app <- (map["app"], ApiObjectTransformType())
        code <- map["code"]
        title <- map["title"]
        API_TYPE <- map["@type"]
        expandable <- map["@expandable"]
    }

    public init() {
        self.code = ""
        self.title = ""
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\Common\\Module\\App\\API\\App\\Package",
            "swift": "B2aDicoCommonAppPackage",
            "typescript": "B2aDicoCommonAppPackage"
        ]
        self.expandable = [:]
    }

}
