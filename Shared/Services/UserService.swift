//
//  UserService.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 13.05.2022.
//

import SwiftUI

class UserService: ObservableObject {

    static let shared = UserService()

    private let userKey = "user"

    @Published public var loggedUser: LoggedUser? = nil

    public var isLogged: Bool {
        return loggedUser != nil
    }

    public func initUserFromDefaults() {
        guard let data = UserDefaults.standard.data(forKey: userKey) else { return }
        loggedUser = try? JSONDecoder().decode(LoggedUser.self, from: data)
    }

    public func saveToDefaults() {
        guard let user = loggedUser, let data = try? JSONEncoder().encode(user) else { return }
        UserDefaults.standard.set(data, forKey: userKey)
    }

    public func logout() {
        loggedUser = nil
        UserDefaults.standard.removeObject(forKey: userKey)
    }
}
