//
//  HRMEployee.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 13.05.2022.
//

import Foundation
import ObjectMapper

open class B2aDicoHRMEmployeeLoggedEmployee: B2aDicoUserUserUser {

    open var personalNr: String?
    open var pin: String?

    public required init?(map: Map) {
        super.init(map: map)
    }

    open override func mapping(map: Map) {
        super.mapping(map: map)
        personalNr <- map["personalNr"]
        pin <- map["pin"]
    }

    public override init() {
        super.init()
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\HRM\\Module\\Employee\\API\\Employee\\LoggedEmployee",
            "swift": "B2aDicoHRMEmployeeLoggedEmployee",
            "typescript": "B2aDicoHRMEmployeeLoggedEmployee"
        ]
        self.expandable.merge([:])
    }

}

open class B2aDicoHRMEmployee: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var id: Int?
    open var name: String!
    open var surname: String!
    open var personalNr: String?
    open var pin: String?
    open var user: B2aDicoUserUserUser?
    open var centers: [B2aDicoOHCenter] = []
    open var centerRelations: [B2aDicoHRMEmployeeCenterRelation] = []
    open var signature: B2aDicoFile?
    open var qualificationRelations: [B2aDicoHRMEmployeeQualificationRelation] = []
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
        personalNr <- map["personalNr"]
        pin <- map["pin"]
        user <- (map["user"], ApiObjectTransformType())
        centers <- (map["centers"], ApiObjectTransformType())
        centerRelations <- (map["centerRelations"], ApiObjectTransformType())
        signature <- (map["signature"], ApiObjectTransformType())
        qualificationRelations <- (map["qualificationRelations"], ApiObjectTransformType())
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
        self.surname = ""
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\HRM\\Module\\Employee\\API\\Employee",
            "swift": "B2aDicoHRMEmployee",
            "typescript": "B2aDicoHRMEmployee"
        ]
        self.expandable = [
            "qualificationRelations": false
        ]
    }

}

open class B2aDicoHRMEmployeeCenterRelation: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var customFields: CustomFieldsType?
    open var id: Int?
    open var employee: B2aDicoHRMEmployee?
    open var center: B2aDicoOHCenter?

    public required init?(map: Map) {}

    open func mapping(map: Map) {
        id <- map["id"]
        employee <- (map["employee"], ApiObjectTransformType())
        center <- (map["center"], ApiObjectTransformType())
        API_TYPE <- map["@type"]
        expandable <- map["@expandable"]
        customFields <- map["@customFields"]
    }

    public init() {
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\HRM\\Module\\Employee\\API\\Employee\\CenterRelation",
            "swift": "B2aDicoHRMEmployeeCenterRelation",
            "typescript": "B2aDicoHRMEmployeeCenterRelation"
        ]
        self.expandable = [:]
    }

}

open class B2aDicoHRMEmployeeWorkplaceRelation: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var id: Int?
    open var employee: B2aDicoHRMEmployee?
//    open var workplace: B2aDicoMESWorkplace?
    open var ordering: Int!

    public required init?(map: Map) {}

    open func mapping(map: Map) {
        id <- map["id"]
        employee <- (map["employee"], ApiObjectTransformType())
//        workplace <- (map["workplace"], ApiObjectTransformType())
        ordering <- map["ordering"]
        API_TYPE <- map["@type"]
        expandable <- map["@expandable"]
    }

    public init() {
        self.ordering = 0
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\HRM\\Module\\Employee\\API\\Employee\\WorkplaceRelation",
            "swift": "B2aDicoHRMEmployeeWorkplaceRelation",
            "typescript": "B2aDicoHRMEmployeeWorkplaceRelation"
        ]
        self.expandable = [:]
    }

}

open class B2aDicoHRMEmployeeQualificationRelation: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var id: Int?
    open var employee: B2aDicoHRMEmployee?
    open var qualification: B2aDicoHRMQualification?

    public required init?(map: Map) {}

    open func mapping(map: Map) {
        id <- map["id"]
        employee <- (map["employee"], ApiObjectTransformType())
        qualification <- (map["qualification"], ApiObjectTransformType())
        API_TYPE <- map["@type"]
        expandable <- map["@expandable"]
    }

    public init() {
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\HRM\\Module\\Employee\\API\\Employee\\QualificationRelation",
            "swift": "B2aDicoHRMEmployeeQualificationRelation",
            "typescript": "B2aDicoHRMEmployeeQualificationRelation"
        ]
        self.expandable = [:]
    }

}
