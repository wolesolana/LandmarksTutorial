//
//  ContentView.swift
//  MacLandmarks
//
//  Created by Wole Solana on 3/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarksListView()
            .frame(minWidth: 700, minHeight: 300)
    }
}

#Preview {
    ContentView()
        .environment(DataStore())
}
