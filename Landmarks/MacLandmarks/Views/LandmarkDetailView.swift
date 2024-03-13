//
//  LandmarksDetailView.swift
//  MacLandmarks
//
//  Created by Wole Solana on 3/12/24.
//

import SwiftUI
import MapKit

struct LandmarkDetailView: View {
    @Environment(DataStore.self) var landmarkDataStore
    var landmark: Landmark
    var landmarkIndex: Int {
        landmarkDataStore.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    var body: some View {
        @Bindable var landmarkDataStore = landmarkDataStore
        ScrollView {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                MapView(coordinate: landmark.locationCoordinate)
                    .frame(height: 300)
                Button("Open in Maps") {
                    let destination = MKMapItem(placemark: MKPlacemark(coordinate: landmark.locationCoordinate))
                    destination.name = landmark.name
                    destination.openInMaps()
                }
                .padding()
            }
            VStack(alignment: .leading, spacing: 20) {
                HStack(spacing: 24) {
                    CircleImageView(image: landmark.image.resizable())
                        .frame(width: 160, height: 160)

                    VStack(alignment: .leading) {
                        HStack {
                            Text(landmark.name)
                                .font(.title)
                            FavoriteButtonView(isSet: $landmarkDataStore.landmarks[landmarkIndex].isFavorite)
                                .buttonStyle(.plain)
                        }
                        VStack(alignment: .leading) {
                            Text(landmark.park)
                            Text(landmark.state)
                        }
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    }
                }
                Divider()
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            .frame(maxWidth: 700)
            .offset(y: -50)
        }
        .navigationTitle(landmark.name)
    }
}

#Preview {
    let landmarkDataStore: DataStore = DataStore()
    return LandmarkDetailView(landmark: landmarkDataStore.landmarks[2])
        .environment(landmarkDataStore)
        .frame(width: 850, height: 700)
}
