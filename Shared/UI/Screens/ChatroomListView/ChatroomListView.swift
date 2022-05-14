//
//  ChatroomListView.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 14.05.2022.
//

import SwiftUI

struct ChatroomListView: View {

    @StateObject var viewModel = ViewModel()

    var body: some View {
        BaseView(isLoading: $viewModel.isLoading) {
            VStack {
                ChatroomListFilterView(isUnreadFilterOn: $viewModel.isUnreadFilterOn,
                                       isRelevantFilterOn: $viewModel.isRelevantFilterOn)
                List {
                    ForEach(viewModel.chatrooms, id: \.id) { chatroom in
                        NavigationLink {
                            ChatroomDetailView(chatroom: chatroom)
                        } label: {
                            ChatroomListCell(chatroom: chatroom,
                                             lastMessage: chatroom.lastMessages.last)
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.getChatrooms()
        }
        .navigationTitle("Místnosti")

        Text("Vyberte místnost")
    }
}

struct ChatroomListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatroomListView()
    }
}
