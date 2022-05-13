//
//  AuthEmployee.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 13.05.2022.
//

import Foundation
import ObjectMapper

open class B2aDicoAuthEmployee: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var id: Int!
    open var name: String!
    open var surname: String!
    open var personalNr: String!

    public required init?(map: Map) {}

    open func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        surname <- map["surname"]
        personalNr <- map["personalNr"]
        API_TYPE <- map["@type"]
        expandable <- map["@expandable"]
    }

    public init() {
        self.id = 0
        self.name = ""
        self.surname = ""
        self.personalNr = ""
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\Auth\\Module\\Employee\\API\\Employee",
            "swift": "B2aDicoAuthEmployee",
            "typescript": "B2aDicoAuthEmployee"
        ]
        self.expandable = [:]
    }

}

open class B2aDicoAuthEmployeeLoggedEmployee: B2aDicoAuthUserLoggedUser {

    open var employee: B2aDicoAuthEmployee?

    public required init?(map: Map) {
        super.init(map: map)
    }

    open override func mapping(map: Map) {
        super.mapping(map: map)
        employee <- (map["employee"], ApiObjectTransformType())
    }

    public override init() {
        super.init()
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\Auth\\Module\\Employee\\API\\LoggedEmployee",
            "swift": "B2aDicoAuthEmployeeLoggedEmployee",
            "typescript": "B2aDicoAuthEmployeeLoggedEmployee"
        ]
        self.expandable.merge([:])
    }

}
