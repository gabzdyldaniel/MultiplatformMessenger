//
//  AppMain.swift
//  MultiplatformMessenger (macOS)
//
//  Created by Daniel Gabzdyl on 14.05.2022.
//

import SwiftUI

@main
struct AppMain: App {

    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ notification: Notification) {
        UserService.shared.initUserFromDefaults()
    }
}
