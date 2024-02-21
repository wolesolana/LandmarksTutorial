//
//  LandmarkDetailView.swift
//  Landmarks
//
//  Created by Wole Solana on 2/14/24.
//

import SwiftUI

struct LandmarkDetailView: View {
    @Environment(DataStore.self) var landmarkDataStore
    var landmark: Landmark
    var landmarkIndex: Int {
        landmarkDataStore.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    var body: some View {
        @Bindable var landmarkDataStore = landmarkDataStore
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
            CircleImageView(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    .foregroundColor(.black)
                    FavoriteButtonView(isSet: $landmarkDataStore.landmarks[landmarkIndex].isFavorite)
                }
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                Divider()
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
        Spacer()
    }
}

#Preview {
    let landmarkDataStore: DataStore = DataStore()
    return LandmarkDetailView(landmark: landmarkDataStore.landmarks[2])
        .environment(landmarkDataStore)
}
