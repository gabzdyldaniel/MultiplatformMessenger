//
//  ChatroomDetailViewModel.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 14.05.2022.
//

import SwiftUI

extension ChatroomDetailView {
    class ViewModel: ObservableObject, MqttObserver {

        @Published var message: String = .empty
        @Published var messages: [B2aDicoMessengerMessage] = [] {
            willSet {
                let groupedDict = Dictionary(grouping: newValue) { (element: B2aDicoMessengerMessage) in
                    return Calendar.current.dateComponents(
                        [.day, .year, .month, .calendar],
                        from: Date(timeIntervalSince1970: element.timestamp))
                }.sorted(by: {
                    $0.key.date?.compare($1.key.date ?? Date()) == .orderedAscending
                })

                groups = Array(groupedDict).compactMap { item in
                    return GroupedMessages(date: item.key.toString(),
                                           messages: item.value)
                }
            }
        }
        @Published var groups: [GroupedMessages] = []
        @Published var isLoading: Bool = false

        private var chatroomId: Int?

        var topic: String {
            return "/b2a/messenger/chat-room/\(chatroomId ?? 0)/message"
        }

        func registerObserver() {
            MqttService.shared.registerObserver(self)
        }

        func getMessages(for chatroomId: Int) {
            isLoading = true

            self.chatroomId = chatroomId

            NetworkService.shared
                .makeRequest("/messenger/api/v1/chat-room/\(chatroomId)/message",
                             parameters: ["limit": -1])
                .validate()
                .responseJSON { response in
                    self.isLoading = false
                    switch response.result {
                    case .success(let json as [String: Any]):
                        guard let dataJson = json["data"] as? [String: Any],
                              let messagesJson = dataJson["data"] as? [[String: Any]] else { fallthrough }
                        self.messages = messagesJson.compactMap({ B2aDicoMessengerMessage(JSON: $0) })
                        break
                    default:
                        break
                    }
                }
        }

        func subscribe() {
            MqttService.shared.subscribe(to: topic)
        }

        func unsubscribe() {
            MqttService.shared.unsubscribe(from: topic)
        }

        func sendMessage() {
            guard let chatroomIdUnwrapped = chatroomId, message.isEmpty == false else {
                return
            }

            let message = DicoMqttMessage()
            message.type = "new-message"

            let createObj = B2aDicoMessengerMessageCreate()
            createObj.uuid = .uuidString(length: 64)
            createObj.content = self.message

            message.data = createObj

            MqttService.shared.publish(string: message.toJSONString() ?? "",
                                       topic: "/b2a/messenger/chat-room/\(chatroomIdUnwrapped)/new-message")

            self.message = .empty
        }

        func onMessageReceive(_ payloadString: String, topic: String) {
            guard let chatroomIdUnwrapped = chatroomId else {
                return
            }

            if topic == "/b2a/messenger/chat-room/\(chatroomIdUnwrapped)/message" {
                let message = DicoMqttMessage(JSONString: payloadString)
                guard let messageAO = message?.data as? B2aDicoMessengerMessage else { return }
                messages.append(messageAO)
            }
        }
    }
}
