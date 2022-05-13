//
//  FileFile.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 13.05.2022.
//

import Foundation
import ObjectMapper

open class B2aDicoFile: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var customFields: CustomFieldsType?
    open var id: Int!
    open var uuid: String!
    open var thumbnailUuid: String?
    open var filename: String!
    open var title: String?
    open var description: String?
    open var note: String?
    open var mimeType: String!
    open var size: Int!
    open var checksum: String!
    open var path: String?
    open var thumbnailPath: String?
    open var created: Date?
    open var createdBy: B2aDicoUserUserUser?
    open var updated: Date?
    open var updatedBy: B2aDicoUserUserUser?
    open var deleted: Date?
    open var deletedBy: B2aDicoUserUserUser?
    open var actions: [B2aDicoCommonActionAction] = []

    public required init?(map: Map) {}

    open func mapping(map: Map) {
        id <- map["id"]
        uuid <- map["uuid"]
        thumbnailUuid <- map["thumbnailUuid"]
        filename <- map["filename"]
        title <- map["title"]
        description <- map["description"]
        note <- map["note"]
        mimeType <- map["mimeType"]
        size <- map["size"]
        checksum <- map["checksum"]
        path <- map["path"]
        thumbnailPath <- map["thumbnailPath"]
        created <- (map["created"], DateTransformType())
        createdBy <- (map["createdBy"], ApiObjectTransformType())
        updated <- (map["updated"], DateTransformType())
        updatedBy <- (map["updatedBy"], ApiObjectTransformType())
        deleted <- (map["deleted"], DateTransformType())
        deletedBy <- (map["deletedBy"], ApiObjectTransformType())
        actions <- (map["actions"], ApiObjectTransformType())
        API_TYPE <- map["@type"]
        expandable <- map["@expandable"]
        customFields <- map["@customFields"]
    }

    public init() {
        self.id = 0
        self.uuid = ""
        self.filename = ""
        self.mimeType = ""
        self.size = 0
        self.checksum = ""
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\File\\Module\\File\\API\\File",
            "swift": "B2aDicoFile",
            "typescript": "B2aDicoFile"
        ]
        self.expandable = [:]
    }

}

