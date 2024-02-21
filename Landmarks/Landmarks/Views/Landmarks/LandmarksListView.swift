//
//  LandmarksListView.swift
//  Landmarks
//
//  Created by Wole Solana on 2/14/24.
//

import SwiftUI

struct LandmarksListView: View {
    @Environment(DataStore.self) var landmarkDataStore
    @State private var showFavoritesOnly: Bool = false
    var favoriteLandmarks: [Landmark] {
        landmarkDataStore.landmarks
            .filter { (!showFavoritesOnly) || $0.isFavorite }
    }

    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                .animation(.default, value: favoriteLandmarks)
                ForEach(favoriteLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetailView(landmark: landmark)
                    } label: {
                        LandmarkRowView(landmark: landmark)
                    }
                }
                .navigationTitle("Landmarks")
            }
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarksListView()
        .environment(DataStore())
}
