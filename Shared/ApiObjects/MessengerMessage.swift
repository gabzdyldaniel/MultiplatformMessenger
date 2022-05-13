//
//  MessengerMessage.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 13.05.2022.
//

import Foundation
import ObjectMapper

open class B2aDicoMessengerMessage: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var id: Int!
    open var uuid: String!
    open var chatRoomId: Int!
    open var timestamp: Double!
    open var content: String!
    open var mentions: [B2aDicoMention] = []
    open var files: [B2aDicoFile] = []
    open var created: Date?
    open var createdBy: B2aDicoUserUserUser?
    open var updated: Date?
    open var updatedBy: B2aDicoUserUserUser?
    open var deleted: Date?
    open var deletedBy: B2aDicoUserUserUser?

    public required init?(map: Map) {}

    open func mapping(map: Map) {
        id <- map["id"]
        uuid <- map["uuid"]
        chatRoomId <- map["chatRoomId"]
        timestamp <- (map["timestamp"], DoubleTransformType())
        content <- map["content"]
        mentions <- (map["mentions"], ApiObjectTransformType())
        files <- (map["files"], ApiObjectTransformType())
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
        self.id = 0
        self.uuid = ""
        self.chatRoomId = 0
        self.timestamp = 0.0
        self.content = ""
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\Messenger\\Module\\Message\\API\\Message",
            "swift": "B2aDicoMessengerMessage",
            "typescript": "B2aDicoMessengerMessage"
        ]
        self.expandable = [:]
    }

}

open class B2aDicoMessengerMessageCreate: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var uuid: String!
    open var content: String!
    open var files: [B2aDicoFile] = []

    public required init?(map: Map) {}

    open func mapping(map: Map) {
        uuid <- map["uuid"]
        content <- map["content"]
        files <- (map["files"], ApiObjectTransformType())
        API_TYPE <- map["@type"]
        expandable <- map["@expandable"]
    }

    public init() {
        self.uuid = ""
        self.content = ""
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\Messenger\\Module\\Message\\API\\Message\\Create",
            "swift": "B2aDicoMessengerMessageCreate",
            "typescript": "B2aDicoMessengerMessageCreate"
        ]
        self.expandable = [:]
    }

}

open class B2aDicoMessengerMessageChatRoom: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var id: Int!
    open var title: String!
    open var description: String?
    open var type: B2aDicoMessengerChatRoomType?
    open var entityInstanceId: Int?

    public required init?(map: Map) {}

    open func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        description <- map["description"]
        type <- (map["type"], ApiObjectTransformType())
        entityInstanceId <- map["entityInstanceId"]
        API_TYPE <- map["@type"]
        expandable <- map["@expandable"]
    }

    public init() {
        self.id = 0
        self.title = ""
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\Messenger\\Module\\Message\\API\\Message\\ChatRoom",
            "swift": "B2aDicoMessengerMessageChatRoom",
            "typescript": "B2aDicoMessengerMessageChatRoom"
        ]
        self.expandable = [:]
    }

}

open class B2aDicoMessengerMessageRead: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var uuid: String!
    open var readBy: B2aDicoUserUserUser?
    open var readAt: Double?
    open var chatRoom: B2aDicoMessengerMessageChatRoom?
    open var counter: B2aDicoMessengerChatRoomCounter?

    public required init?(map: Map) {}

    open func mapping(map: Map) {
        uuid <- map["uuid"]
        readBy <- (map["readBy"], ApiObjectTransformType())
        readAt <- map["readAt"]
        chatRoom <- (map["chatRoom"], ApiObjectTransformType())
        counter <- (map["counter"], ApiObjectTransformType())
        API_TYPE <- map["@type"]
        expandable <- map["@expandable"]
    }

    public init() {
        self.uuid = ""
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\Messenger\\Module\\Message\\API\\Message\\Read",
            "swift": "B2aDicoMessengerMessageRead",
            "typescript": "B2aDicoMessengerMessageRead"
        ]
        self.expandable = [:]
    }

}

open class B2aDicoMessengerMessageNotification: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var isUnread: Bool!
    open var isRelevant: Bool!
    open var message: B2aDicoMessengerMessage?
    open var chatRoom: B2aDicoMessengerMessageChatRoom?
    open var counter: B2aDicoMessengerChatRoomCounter?

    public required init?(map: Map) {}

    open func mapping(map: Map) {
        isUnread <- map["isUnread"]
        isRelevant <- map["isRelevant"]
        message <- (map["message"], ApiObjectTransformType())
        chatRoom <- (map["chatRoom"], ApiObjectTransformType())
        counter <- (map["counter"], ApiObjectTransformType())
        API_TYPE <- map["@type"]
        expandable <- map["@expandable"]
    }

    public init() {
        self.isUnread = false
        self.isRelevant = false
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\Messenger\\Module\\Message\\API\\Message\\Notification",
            "swift": "B2aDicoMessengerMessageNotification",
            "typescript": "B2aDicoMessengerMessageNotification"
        ]
        self.expandable = [:]
    }

}

