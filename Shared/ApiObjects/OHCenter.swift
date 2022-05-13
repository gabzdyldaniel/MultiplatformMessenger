//
//  OHCenter.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 13.05.2022.
//

import Foundation
import ObjectMapper

open class B2aDicoOHCenter: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var customFields: CustomFieldsType?
    open var id: Int?
    open var parentCenter: B2aDicoOHCenter?
    open var title: String!
    open var number: String!
    open var code: String!
    open var codePartial: String?
    open var validFrom: Date!
    open var validTill: Date?
    open var created: Date?
    open var createdBy: B2aDicoUserUserUser?
    open var updated: Date?
    open var updatedBy: B2aDicoUserUserUser?
    open var deleted: Date?
    open var deletedBy: B2aDicoUserUserUser?

    public required init?(map: Map) {}

    open func mapping(map: Map) {
        id <- map["id"]
        parentCenter <- (map["parentCenter"], ApiObjectTransformType())
        title <- map["title"]
        number <- map["number"]
        code <- map["code"]
        codePartial <- map["codePartial"]
        validFrom <- (map["validFrom"], DateTransformType())
        validTill <- (map["validTill"], DateTransformType())
        created <- (map["created"], DateTransformType())
        createdBy <- (map["createdBy"], ApiObjectTransformType())
        updated <- (map["updated"], DateTransformType())
        updatedBy <- (map["updatedBy"], ApiObjectTransformType())
        deleted <- (map["deleted"], DateTransformType())
        deletedBy <- (map["deletedBy"], ApiObjectTransformType())
        API_TYPE <- map["@type"]
        expandable <- map["@expandable"]
        customFields <- map["@customFields"]
    }

    public init() {
        self.title = ""
        self.number = ""
        self.code = ""
        self.validFrom = Date()
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\OH\\Module\\Center\\API\\Center",
            "swift": "B2aDicoOHCenter",
            "typescript": "B2aDicoOHCenter"
        ]
        self.expandable = [:]
    }

}

