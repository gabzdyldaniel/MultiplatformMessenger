//
//  MessengerChatRoom.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 13.05.2022.
//

import Foundation
import ObjectMapper

open class B2aDicoMessengerChatRoom: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var id: Int!
    open var title: String!
    open var description: String?
    open var lastMessageId: Int?
    open var lastMessageTimestamp: Double?
    open var lastMessages: [B2aDicoMessengerMessage] = []
    open var type: B2aDicoMessengerChatRoomType?
    open var entityInstanceId: Int?
    open var userSetting: B2aDicoMessengerChatRoomUserSetting?
    open var created: Date?
    open var createdBy: B2aDicoUserUserUser?
    open var updated: Date?
    open var updatedBy: B2aDicoUserUserUser?
    open var deleted: Date?
    open var deletedBy: B2aDicoUserUserUser?

    public required init?(map: Map) {}

    open func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        description <- map["description"]
        lastMessageId <- map["lastMessageId"]
        lastMessageTimestamp <- (map["lastMessageTimestamp"], DoubleTransformType())
        lastMessages <- (map["lastMessages"], ApiObjectTransformType())
        type <- (map["type"], ApiObjectTransformType())
        entityInstanceId <- map["entityInstanceId"]
        userSetting <- (map["userSetting"], ApiObjectTransformType())
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
        self.title = ""
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\Messenger\\Module\\ChatRoom\\API\\ChatRoom",
            "swift": "B2aDicoMessengerChatRoom",
            "typescript": "B2aDicoMessengerChatRoom"
        ]
        self.expandable = [:]
    }

}

open class B2aDicoMessengerChatRoomCounter: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var totalUnread: Int?
    open var totalUnreadRelevant: Int?

    public required init?(map: Map) {}

    open func mapping(map: Map) {
        totalUnread <- map["totalUnread"]
        totalUnreadRelevant <- map["totalUnreadRelevant"]
        API_TYPE <- map["@type"]
        expandable <- map["@expandable"]
    }

    public init() {
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\Messenger\\Module\\ChatRoom\\API\\ChatRoom\\Counter",
            "swift": "B2aDicoMessengerChatRoomCounter",
            "typescript": "B2aDicoMessengerChatRoomCounter"
        ]
        self.expandable = [:]
    }

}

open class B2aDicoMessengerChatRoomStatus: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var isUnread: Bool!
    open var isUnreadRelevant: Bool!

    public required init?(map: Map) {}

    open func mapping(map: Map) {
        isUnread <- map["isUnread"]
        isUnreadRelevant <- map["isUnreadRelevant"]
        API_TYPE <- map["@type"]
        expandable <- map["@expandable"]
    }

    public init() {
        self.isUnread = false
        self.isUnreadRelevant = false
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\Messenger\\Module\\ChatRoom\\API\\ChatRoom\\Status",
            "swift": "B2aDicoMessengerChatRoomStatus",
            "typescript": "B2aDicoMessengerChatRoomStatus"
        ]
        self.expandable = [:]
    }

}

open class B2aDicoMessengerChatRoomType: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var id: Int!
    open var code: String!
    open var title: String!
    open var multiparty: Bool!
    open var entity: B2aDicoCoreEntityEntity?

    public required init?(map: Map) {}

    open func mapping(map: Map) {
        id <- map["id"]
        code <- map["code"]
        title <- map["title"]
        multiparty <- map["multiparty"]
        entity <- (map["entity"], ApiObjectTransformType())
        API_TYPE <- map["@type"]
        expandable <- map["@expandable"]
    }

    public init() {
        self.id = 0
        self.code = ""
        self.title = ""
        self.multiparty = false
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\Messenger\\Module\\ChatRoom\\API\\ChatRoom\\Type",
            "swift": "B2aDicoMessengerChatRoomType",
            "typescript": "B2aDicoMessengerChatRoomType"
        ]
        self.expandable = [:]
    }

}

open class B2aDicoMessengerChatRoomUserAccess: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var chatRoom: B2aDicoMessengerChatRoom?
    open var user: B2aDicoUserUserUser?

    public required init?(map: Map) {}

    open func mapping(map: Map) {
        chatRoom <- (map["chatRoom"], ApiObjectTransformType())
        user <- (map["user"], ApiObjectTransformType())
        API_TYPE <- map["@type"]
        expandable <- map["@expandable"]
    }

    public init() {
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\Messenger\\Module\\ChatRoom\\API\\ChatRoom\\UserAccess",
            "swift": "B2aDicoMessengerChatRoomUserAccess",
            "typescript": "B2aDicoMessengerChatRoomUserAccess"
        ]
        self.expandable = [:]
    }

}

open class B2aDicoMessengerChatRoomUserGroupAccess: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var chatRoom: B2aDicoMessengerChatRoom?
    open var userGroup: B2aDicoUserUserUserGroup?

    public required init?(map: Map) {}

    open func mapping(map: Map) {
        chatRoom <- (map["chatRoom"], ApiObjectTransformType())
        userGroup <- (map["userGroup"], ApiObjectTransformType())
        API_TYPE <- map["@type"]
        expandable <- map["@expandable"]
    }

    public init() {
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\Messenger\\Module\\ChatRoom\\API\\ChatRoom\\UserGroupAccess",
            "swift": "B2aDicoMessengerChatRoomUserGroupAccess",
            "typescript": "B2aDicoMessengerChatRoomUserGroupAccess"
        ]
        self.expandable = [:]
    }

}

open class B2aDicoMessengerChatRoomUserRoleAccess: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var chatRoom: B2aDicoMessengerChatRoom?
    open var userRole: B2aDicoUserUserUserRole?

    public required init?(map: Map) {}

    open func mapping(map: Map) {
        chatRoom <- (map["chatRoom"], ApiObjectTransformType())
        userRole <- (map["userRole"], ApiObjectTransformType())
        API_TYPE <- map["@type"]
        expandable <- map["@expandable"]
    }

    public init() {
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\Messenger\\Module\\ChatRoom\\API\\ChatRoom\\UserRoleAccess",
            "swift": "B2aDicoMessengerChatRoomUserRoleAccess",
            "typescript": "B2aDicoMessengerChatRoomUserRoleAccess"
        ]
        self.expandable = [:]
    }

}

open class B2aDicoMessengerChatRoomUserSetting: ApiObject {

    open var API_TYPE: [String: String] = [:]
    open var expandable: [String: Bool] = [:]
    open var userId: Int!
    open var user: B2aDicoUserUserUser?
    open var chatRoomId: Int!
    open var chatRoom: B2aDicoMessengerChatRoom?
    open var lastSeenMessageId: Int?
    open var lastSeenMessageTimestamp: Double?
    open var lastRelevantMessageId: Int?
    open var lastRelevantMessageTimestamp: Double?
    open var lastSeenRelevantMessageId: Int?
    open var lastSeenRelevantMessageTimestamp: Double?

    public required init?(map: Map) {}

    open func mapping(map: Map) {
        userId <- map["userId"]
        user <- (map["user"], ApiObjectTransformType())
        chatRoomId <- map["chatRoomId"]
        chatRoom <- (map["chatRoom"], ApiObjectTransformType())
        lastSeenMessageId <- map["lastSeenMessageId"]
        lastSeenMessageTimestamp <- (map["lastSeenMessageTimestamp"], DoubleTransformType())
        lastRelevantMessageId <- map["lastRelevantMessageId"]
        lastRelevantMessageTimestamp <- (map["lastRelevantMessageTimestamp"], DoubleTransformType())
        lastSeenRelevantMessageId <- map["lastSeenRelevantMessageId"]
        lastSeenRelevantMessageTimestamp <- (map["lastSeenRelevantMessageTimestamp"], DoubleTransformType())
        API_TYPE <- map["@type"]
        expandable <- map["@expandable"]
    }

    public init() {
        self.userId = 0
        self.chatRoomId = 0
        self.API_TYPE = [
            "php": "\\B2A\\DICO\\Messenger\\Module\\ChatRoom\\API\\ChatRoom\\UserSetting",
            "swift": "B2aDicoMessengerChatRoomUserSetting",
            "typescript": "B2aDicoMessengerChatRoomUserSetting"
        ]
        self.expandable = [:]
    }

}

