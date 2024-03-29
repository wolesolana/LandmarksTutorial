//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Wole Solana on 2/14/24.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var landmarkDataStore = DataStore()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(landmarkDataStore)
        }
        #if !os(watchOS)
        .commands {
            LandmarkCommands()
        }
        #endif

        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif

        #if os(macOS)
        Settings {
            LandmarkSettingsView()
        }
        #endif
    }
}
