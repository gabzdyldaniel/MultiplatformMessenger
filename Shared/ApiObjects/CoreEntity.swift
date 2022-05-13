//
//  CoreEntity.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 13.05.2022.
//

import Foundation
import ObjectMapper

open class B2aDicoCoreEntityEntityAction: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var id: Int?
    open var name: String!
    open var entity: B2aDicoCoreEntityEntity?

    public required init?(map: Map) {}

    open func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        entity <- (map["entity"], ApiObjectTransformType())
        API_TYPE <- map["@type"]
        expandable <- map["@expandable"]
    }

    public init() {
        self.name = ""
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\Core\\Module\\Entity\\API\\Entity\\Action",
            "swift": "B2aDicoCoreEntityEntityAction",
            "typescript": "B2aDicoCoreEntityEntityAction"
        ]
        self.expandable = [:]
    }

}

open class B2aDicoCoreEntityEntity: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var id: Int?
    open var name: String!
    open var description: String?
    open var className: String!
    open var active: Bool!
    open var code: String!
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
        description <- map["description"]
        className <- map["className"]
        active <- map["active"]
        code <- map["code"]
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
        self.className = ""
        self.active = false
        self.code = ""
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\Core\\Module\\Entity\\API\\Entity",
            "swift": "B2aDicoCoreEntityEntity",
            "typescript": "B2aDicoCoreEntityEntity"
        ]
        self.expandable = [:]
    }

}

