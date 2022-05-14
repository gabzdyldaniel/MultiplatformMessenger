//
//  InitialsAvatarView.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 14.05.2022.
//

import SwiftUI

struct InitialsAvatarView: View {

    var initials: String

    var body: some View {
        Text(initials)
            .font(.footnote)
            .frame(width: 35, height: 35)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.primary, lineWidth: 1)
            }
    }
}

struct InitialsAvatarView_Previews: PreviewProvider {
    static var previews: some View {
        InitialsAvatarView(initials: "JN")
    }
}
