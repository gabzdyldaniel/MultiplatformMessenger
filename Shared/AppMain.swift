//
//  AppMain.swift
//  MultiplatformMessenger (iOS)
//
//  Created by Daniel Gabzdyl on 13.05.2022.
//

import SwiftUI

@main
struct AppMain: App {

    init() {
        UserService.shared.initUserFromDefaults()
        MqttService.shared.prepareMqttConnection()
        MqttService.shared.connect()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
