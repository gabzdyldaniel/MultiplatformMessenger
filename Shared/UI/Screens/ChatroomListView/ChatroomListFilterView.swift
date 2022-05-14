//
//  ChatroomListFilterView.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 14.05.2022.
//

import SwiftUI

struct ChatroomListFilterView: View {

    @Binding var isUnreadFilterOn: Bool
    @Binding var isRelevantFilterOn: Bool

    var body: some View {
        HStack {
            FilterToggle(title: "Nepřečtené",
                         isOn: $isUnreadFilterOn)

            Spacer()
                .frame(width: 15)

            FilterToggle(title: "Relevantní",
                         isOn: $isRelevantFilterOn)
        }
    }
}

struct ChatroomListFilterView_Previews: PreviewProvider {

    @State static var isUnreadFilterOn = false
    @State static var isRelevantFilterOn = false

    static var previews: some View {
        ChatroomListFilterView(isUnreadFilterOn: $isUnreadFilterOn,
                               isRelevantFilterOn: $isRelevantFilterOn)
    }
}
