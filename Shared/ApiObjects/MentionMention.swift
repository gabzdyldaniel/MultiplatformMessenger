//
//  MentionMention.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 13.05.2022.
//

import Foundation
import ObjectMapper

open class B2aDicoMention: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var id: Int?
    open var title: String!
    open var code: String!

    public required init?(map: Map) {}

    open func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        code <- map["code"]
        API_TYPE <- map["@type"]
        expandable <- map["@expandable"]
    }

    public init() {
        self.title = ""
        self.code = ""
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\Mention\\Module\\Mention\\API\\Mention",
            "swift": "B2aDicoMention",
            "typescript": "B2aDicoMention"
        ]
        self.expandable = [:]
    }

}

