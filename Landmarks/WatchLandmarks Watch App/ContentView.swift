//
//  ContentView.swift
//  WatchLandmarks Watch App
//
//  Created by Wole Solana on 3/8/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarksListView()
    }
}

#Preview {
    ContentView()
        .environment(DataStore())
}
