//
//  CommonColor.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 13.05.2022.
//

import Foundation
import ObjectMapper

open class B2aDicoCommonColorColor: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var value: String!
    open var valueDarkMode: String!

    public required init?(map: Map) {}

    open func mapping(map: Map) {
        value <- map["value"]
        valueDarkMode <- map["valueDarkMode"]
        API_TYPE <- map["@type"]
        expandable <- map["@expandable"]
    }

    public init() {
        self.value = ""
        self.valueDarkMode = ""
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\Common\\Module\\Color\\API\\Color",
            "swift": "B2aDicoCommonColorColor",
            "typescript": "B2aDicoCommonColorColor"
        ]
        self.expandable = [:]
    }

}

open class B2aDicoCommonColorColorSchema: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var foreground: B2aDicoCommonColorColor?
    open var background: B2aDicoCommonColorColor?

    public required init?(map: Map) {}

    open func mapping(map: Map) {
        foreground <- (map["foreground"], ApiObjectTransformType())
        background <- (map["background"], ApiObjectTransformType())
        API_TYPE <- map["@type"]
        expandable <- map["@expandable"]
    }

    public init() {
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\Common\\Module\\Color\\API\\Color\\Schema",
            "swift": "B2aDicoCommonColorColorSchema",
            "typescript": "B2aDicoCommonColorColorSchema"
        ]
        self.expandable = [:]
    }

}

