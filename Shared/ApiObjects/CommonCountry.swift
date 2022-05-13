//
//  CommonCountry.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 13.05.2022.
//

import Foundation
import ObjectMapper

open class B2aDicoCommonCountryCountry: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var id: Int?
    open var name: String!
    open var shortcut: String!
    open var active: Bool!
    open var created: Date?
    open var createdBy: B2aDicoUserUserUser?
    open var updated: Date?
    open var updatedBy: B2aDicoUserUserUser?
    open var deleted: Date?
    open var deletedBy: B2aDicoUserUserUser?

    public required init?(map: Map) {}

    open func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        shortcut <- map["shortcut"]
        active <- map["active"]
        created <- (map["created"], DateTransformType())
        createdBy <- (map["createdBy"], ApiObjectTransformType())
        updated <- (map["updated"], DateTransformType())
        updatedBy <- (map["updatedBy"], ApiObjectTransformType())
        deleted <- (map["deleted"], DateTransformType())
        deletedBy <- (map["deletedBy"], ApiObjectTransformType())
        API_TYPE <- map["@type"]
        expandable <- map["@expandable"]
    }

    public init() {
        self.name = ""
        self.shortcut = ""
        self.active = false
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\Common\\Module\\Country\\API\\Country",
            "swift": "B2aDicoCommonCountryCountry",
            "typescript": "B2aDicoCommonCountryCountry"
        ]
        self.expandable = [:]
    }

}
