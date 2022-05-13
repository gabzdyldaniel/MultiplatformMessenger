//
//  HRMQualification.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 13.05.2022.
//

import Foundation
import ObjectMapper

open class B2aDicoHRMQualification: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var id: Int?
    open var code: String!
    open var title: String?
    open var note: String?
    open var created: Date?
    open var createdBy: B2aDicoUserUserUser?
    open var updated: Date?
    open var updatedBy: B2aDicoUserUserUser?
    open var deleted: Date?
    open var deletedBy: B2aDicoUserUserUser?

    public required init?(map: Map) {}

    open func mapping(map: Map) {
        id <- map["id"]
        code <- map["code"]
        title <- map["title"]
        note <- map["note"]
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
        self.code = ""
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\HRM\\Module\\Qualification\\API\\Qualification",
            "swift": "B2aDicoHRMQualification",
            "typescript": "B2aDicoHRMQualification"
        ]
        self.expandable = [:]
    }

}
