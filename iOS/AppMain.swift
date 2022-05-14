//
//  AppMain.swift
//  MultiplatformMessenger (iOS)
//
//  Created by Daniel Gabzdyl on 13.05.2022.
//

import SwiftUI

@main
struct AppMain: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        UserService.shared.initUserFromDefaults()

        return true
    }
}
