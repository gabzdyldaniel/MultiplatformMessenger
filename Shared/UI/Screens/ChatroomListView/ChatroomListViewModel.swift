//
//  ChatroomListViewModel.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 14.05.2022.
//

import Foundation

extension ChatroomListView {
    class ViewModel: ObservableObject {
        @Published var chatrooms: [B2aDicoMessengerChatRoom] = []

        @Published var isUnreadFilterOn: Bool = false {
            didSet {
                getChatrooms()
            }
        }
        @Published var isRelevantFilterOn: Bool = false {
            didSet {
                getChatrooms()
            }
        }

        @Published var isLoading: Bool = false

        func getChatrooms() {
            isLoading = true

            self.chatrooms.removeAll()

            NetworkService.shared
                .makeRequest("/messenger/api/v1/chat-room",
                             parameters: [
                                "onlyUnread": isUnreadFilterOn,
                                "onlyRelevant": isRelevantFilterOn])
                .validate()
                .responseJSON { response in
                    self.isLoading = false
                    switch response.result {
                    case .success(let json as [String: Any]):
                        guard let json = json["data"] as? [String: Any],
                              let chatroomsJson = json["data"] as? [[String: Any]] else { fallthrough }

                        for item in chatroomsJson {
                            guard let apiObject = item.apiObject as? B2aDicoMessengerChatRoom else { return }
                            self.chatrooms.append(apiObject)
                        }
                        break
                    default:
                        break
                    }
                }
        }
    }
}
