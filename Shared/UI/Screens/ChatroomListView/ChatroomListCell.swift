//
//  ChatroomListCell.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 14.05.2022.
//

import SwiftUI

struct ChatroomListCell: View {

    var chatroom: B2aDicoMessengerChatRoom
    var lastMessage: B2aDicoMessengerMessage?

    var body: some View {
        HStack(spacing: 15) {
            InitialsAvatarView(initials: lastMessage?.createdBy?.initials ?? "N/A")
                .if((chatroom.lastMessageTimestamp ?? 0) > (chatroom.userSetting?.lastSeenMessageTimestamp ?? 0)) {
                    $0.overlay {
                        Circle().stroke(Color.greenBlueFour, lineWidth: 2)
                    }
                }
            VStack(alignment: .leading) {
                HStack {
                    Text(chatroom.title)
                        .bold()
                        .lineLimit(1)

                    Spacer()

                    if let lastMessageTimestamp = lastMessage?.timestamp {
                        Text(Date(timeIntervalSince1970: lastMessageTimestamp).getStringDate("dd.MM.yyyy"))
                            .foregroundColor(.gray)
                            .font(.footnote)
                            .layoutPriority(1)
                    }
                }

                Spacer(minLength: 5)

                if let lastMessageUnwrapped = lastMessage {
                    HStack(spacing: 5) {
                        Text("\(lastMessageUnwrapped.createdBy?.fullName ?? "N/A"):")
                            .layoutPriority(1)

                        Text(lastMessageUnwrapped.content)
                    }
                    .lineLimit(1)
                    .font(.footnote)
                }
            }

        }
    }
}

struct ChatroomListCell_Previews: PreviewProvider {
    static var previews: some View {
        ChatroomListCell(chatroom: B2aDicoMessengerChatRoom())
    }
}
