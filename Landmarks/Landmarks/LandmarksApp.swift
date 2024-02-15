//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Wole Solana on 2/14/24.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var landmarkDataStore = LandmarkDataStore()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(landmarkDataStore)
        }
    }
}
