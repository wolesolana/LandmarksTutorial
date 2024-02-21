//
//  ContentView.swift
//  Landmarks
//
//  Created by Wole Solana on 2/14/24.
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
