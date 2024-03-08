//
//  ContentView.swift
//  WatchLandmarks Watch App
//
//  Created by Wole Solana on 3/8/24.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        LandmarksListView()
            .task {
                let center = UNUserNotificationCenter.current()
                _ = try? await center.requestAuthorization(
                    options: [.alert, .sound, .badge]
                )
            }
    }
}

#Preview {
    ContentView()
        .environment(DataStore())
}
