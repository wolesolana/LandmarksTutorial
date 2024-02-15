//
//  LandmarksListView.swift
//  Landmarks
//
//  Created by Wole Solana on 2/14/24.
//

import SwiftUI

struct LandmarksListView: View {
    var body: some View {
        NavigationSplitView {
            List(landmarks) { landmark in
                NavigationLink {
                    LandmarkDetailView(landmark: landmark)
                } label: {
                    LandmarkRowView(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarksListView()
}
