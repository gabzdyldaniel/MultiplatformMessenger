//
//  CommonAction.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 13.05.2022.
//

import Foundation
import ObjectMapper

open class B2aDicoCommonActionAction: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var title: String!
    open var code: String!
    open var show: Bool!
    open var available: Bool!
    open var color: B2aDicoCommonColorColorSchema?
    open var data: Any?

    public required init?(map: Map) {}

    open func mapping(map: Map) {
        title <- map["title"]
        code <- map["code"]
        show <- map["show"]
        available <- map["available"]
        color <- (map["color"], ApiObjectTransformType())
        data <- map["data"]
        API_TYPE <- map["@type"]
        expandable <- map["@expandable"]
    }

    public init() {
        self.title = ""
        self.code = ""
        self.show = false
        self.available = false
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\Common\\Module\\Action\\API\\Action",
            "swift": "B2aDicoCommonActionAction",
            "typescript": "B2aDicoCommonActionAction"
        ]
        self.expandable = [:]
    }

}

