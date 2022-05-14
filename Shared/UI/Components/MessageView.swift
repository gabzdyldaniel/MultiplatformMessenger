//
//  MessageView.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 14.05.2022.
//

import SwiftUI

struct MessageView: View {

    var message: B2aDicoMessengerMessage

    var body: some View {
        HStack(spacing: 15) {
            InitialsAvatarView(initials: message.createdBy?.initials ?? "N/A")

            VStack(alignment: .leading) {
                Text(message.createdBy?.fullName ?? "N/A")
                    .bold()
                    .lineLimit(1)

                Spacer(minLength: 5)

                HStack(spacing: 5) {
                    Text(message.content)
                        .font(.footnote)
                }
            }

            Spacer(minLength: 15)

            Text(Date(timeIntervalSince1970: message.timestamp).getStringDate("HH:mm"))
                .foregroundColor(.gray)
                .font(.footnote)
        }
        .padding()
        .if(message.createdBy?.id == UserService.shared.loggedUser?.userId) {
            $0.background(Color.paleGreyThree)
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: B2aDicoMessengerMessage())
    }
}
