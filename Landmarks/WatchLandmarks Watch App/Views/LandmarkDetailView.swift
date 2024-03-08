//
//  LandmarkDetailView.swift
//  WatchLandmarks Watch App
//
//  Created by Wole Solana on 3/8/24.
//

import SwiftUI

struct LandmarkDetailView: View {
    @Environment(DataStore.self) var dataStore
    var landmark: Landmark
    var landmarkIndex: Int {
        dataStore.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    var body: some View {
        @Bindable var dataStore = dataStore
        ScrollView {
            VStack {
                CircleImageView(image: landmark.image.resizable())
                    .scaledToFit()
                Text(landmark.name)
                    .font(.headline)
                    .lineLimit(0)
                Toggle(isOn: $dataStore.landmarks[landmarkIndex].isFavorite) {
                    Text("Favorite")
                }

                Divider()

                Text(landmark.park)
                    .font(.caption)
                    .bold()
                    .lineLimit(0)
                Text(landmark.state)
                    .font(.caption)

                Divider()

                MapView(coordinate: landmark.locationCoordinate)
                    .scaledToFit()
            }
            .padding(16)
        }
        .navigationTitle("Landmarks")
    }
}

#Preview {
    let dataStore: DataStore = DataStore()
    return LandmarkDetailView(landmark: dataStore.landmarks[2])
        .environment(dataStore)
}
