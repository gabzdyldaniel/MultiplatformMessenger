//
//  MessageAreaView.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 14.05.2022.
//

import SwiftUI

struct MessageAreaView: View {

    @Binding var message: String
    var action: () -> Void

    var body: some View {
        HStack(alignment: .top) {
            TextEditor(text: $message)
                .padding()

            Button(action: action, label: {
                Image(systemName: "paperplane.fill")
            })
            .buttonStyle(SendButtonStyle())
            .keyboardShortcut(KeyEquivalent.return)
            .padding()
        }
        .padding(5)
        .frame(maxWidth: .infinity, maxHeight: 150)
        #if os(macOS)
        .background(Color(NSColor.windowBackgroundColor))
        #else
        .background(Color(UIColor.secondarySystemBackground))
        #endif
    }
}

struct SendButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .foregroundColor(.white)
            .background(Color.greenBlueFour)
            .cornerRadius(8)
    }
}

struct MessageAreaView_Previews: PreviewProvider {

    @State static var message: String = .empty

    static var previews: some View {
        MessageAreaView(message: $message, action: {})
    }
}
