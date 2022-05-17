//
//  ContentView.swift
//  Shared
//
//  Created by Daniel Gabzdyl on 13.05.2022.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var userService = UserService.shared

    var body: some View {
        if userService.isLogged {
            NavigationView {
                ChatroomListView()
                    .toolbar {
                        Button("Odhlásit se") {
                            userService.logout()
                        }
                    }
            }
            .macOS {
                $0.frame(minWidth: 1230, minHeight: 715)
            }
        } else {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
