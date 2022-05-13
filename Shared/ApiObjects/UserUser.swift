//
//  UserUser.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 13.05.2022.
//

import Foundation
import ObjectMapper

open class B2aDicoUserUserUserGroup: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var id: Int?
    open var name: String!
    open var code: String!
    open var active: Bool!
    open var roles: [B2aDicoUserUserUserRole] = []
    open var users: [B2aDicoUserUserUser] = []
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
        code <- map["code"]
        active <- map["active"]
        roles <- (map["roles"], ApiObjectTransformType())
        users <- (map["users"], ApiObjectTransformType())
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
        self.code = ""
        self.active = false
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\User\\Module\\User\\API\\User\\Group",
            "swift": "B2aDicoUserUserUserGroup",
            "typescript": "B2aDicoUserUserUserGroup"
        ]
        self.expandable = [:]
    }

}

open class B2aDicoUserUserUserRole: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var id: Int?
    open var name: String!
    open var code: String!
    open var active: Bool!
    open var app: B2aDicoCommonAppApp?
    open var package: B2aDicoCommonAppPackage?
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
        code <- map["code"]
        active <- map["active"]
        app <- (map["app"], ApiObjectTransformType())
        package <- (map["package"], ApiObjectTransformType())
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
        self.code = ""
        self.active = false
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\User\\Module\\User\\API\\User\\Role",
            "swift": "B2aDicoUserUserUserRole",
            "typescript": "B2aDicoUserUserUserRole"
        ]
        self.expandable = [:]
    }

}

open class B2aDicoUserUserUserState: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var id: Int?
    open var name: String!
    open var code: String!
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
        code <- map["code"]
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
        self.code = ""
        self.active = false
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\User\\Module\\User\\API\\User\\State",
            "swift": "B2aDicoUserUserUserState",
            "typescript": "B2aDicoUserUserUserState"
        ]
        self.expandable = [:]
    }

}

open class B2aDicoUserUserUser: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var customFields: CustomFieldsType?
    open var id: Int?
    open var name: String!
    open var surname: String!
    open var email: String!
    open var passwd: String?
    open var apiKey: String?
    open var state: B2aDicoUserUserUserState?
    open var country: B2aDicoCommonCountryCountry?
    open var roles: [B2aDicoUserUserUserRole] = []
    open var groups: [B2aDicoUserUserUserGroup] = []
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
        surname <- map["surname"]
        email <- map["email"]
        passwd <- map["passwd"]
        apiKey <- map["apiKey"]
        state <- (map["state"], ApiObjectTransformType())
        country <- (map["country"], ApiObjectTransformType())
        roles <- (map["roles"], ApiObjectTransformType())
        groups <- (map["groups"], ApiObjectTransformType())
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
        self.name = ""
        self.surname = ""
        self.email = ""
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\User\\Module\\User\\API\\User",
            "swift": "B2aDicoUserUserUser",
            "typescript": "B2aDicoUserUserUser"
        ]
        self.expandable = [:]
    }

}

open class B2aDicoUserUserChangeMyPasswordRequest: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var oldPassword: String!
    open var newPassword: String!

    public required init?(map: Map) {}

    open func mapping(map: Map) {
        oldPassword <- map["oldPassword"]
        newPassword <- map["newPassword"]
        API_TYPE <- map["@type"]
        expandable <- map["@expandable"]
    }

    public init() {
        self.oldPassword = ""
        self.newPassword = ""
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\User\\Module\\User\\API\\ChangeMyPasswordRequest",
            "swift": "B2aDicoUserUserChangeMyPasswordRequest",
            "typescript": "B2aDicoUserUserChangeMyPasswordRequest"
        ]
        self.expandable = [:]
    }

}

open class B2aDicoUserUserRecoverMyPasswordRequest: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var token: String!
    open var newPassword: String!

    public required init?(map: Map) {}

    open func mapping(map: Map) {
        token <- map["token"]
        newPassword <- map["newPassword"]
        API_TYPE <- map["@type"]
        expandable <- map["@expandable"]
    }

    public init() {
        self.token = ""
        self.newPassword = ""
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\User\\Module\\User\\API\\RecoverMyPasswordRequest",
            "swift": "B2aDicoUserUserRecoverMyPasswordRequest",
            "typescript": "B2aDicoUserUserRecoverMyPasswordRequest"
        ]
        self.expandable = [:]
    }

}

open class B2aDicoUserEmailAvailability: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var address: String!
    open var isAvailable: Bool!

    public required init?(map: Map) {}

    open func mapping(map: Map) {
        address <- map["address"]
        isAvailable <- map["isAvailable"]
        API_TYPE <- map["@type"]
        expandable <- map["@expandable"]
    }

    public init() {
        self.address = ""
        self.isAvailable = false
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\User\\Module\\User\\API\\User\\EmailAvailability",
            "swift": "B2aDicoUserEmailAvailability",
            "typescript": "B2aDicoUserEmailAvailability"
        ]
        self.expandable = [:]
    }

}
