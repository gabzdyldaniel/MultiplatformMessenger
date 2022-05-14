//
//  ChatroomDetailView.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 14.05.2022.
//

import SwiftUI

struct ChatroomDetailView: View {

    var chatroom: B2aDicoMessengerChatRoom

    @StateObject private var viewModel = ViewModel()

    init(chatroom: B2aDicoMessengerChatRoom) {
        self.chatroom = chatroom

        // sets clear background for TextEditor view
        UITextView.appearance().backgroundColor = .clear
    }

    var body: some View {
        BaseView(isLoading: $viewModel.isLoading) {
            VStack {
                ScrollView {
                    ScrollViewReader { scrollView in
                        LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                            ForEach(viewModel.groups, id: \.date) { group in
                                Section(header: DayDividerView(date: group.date)) {
                                    ForEach(group.messages, id: \.timestamp) { message in
                                        MessageView(message: message)
                                            .id(message.timestamp)
                                    }
                                }
                            }
                        }
                        .onChange(of: viewModel.messages) { messages in
                            withAnimation {
                                guard let lastMessageTimestamp = viewModel.messages.last?.timestamp else {
                                    return
                                }
                                scrollView.scrollTo(lastMessageTimestamp)
                            }
                        }
                    }
                }
                .onTapGesture {
                    hideKeyboard()
                }

                MessageAreaView(message: $viewModel.message, action: viewModel.sendMessage)
            }
        }
        .onAppear {
            guard let chatroomId = chatroom.id else { return }
            viewModel.getMessages(for: chatroomId)
        }
        .navigationTitle("\(chatroom.title)")
    }
}

struct ChatroomDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ChatroomDetailView(chatroom: B2aDicoMessengerChatRoom())
    }
}
