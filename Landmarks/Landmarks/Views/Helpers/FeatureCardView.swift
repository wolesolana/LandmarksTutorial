//
//  FeatureCardView.swift
//  Landmarks
//
//  Created by Wole Solana on 3/4/24.
//

import SwiftUI

struct FeatureCardView: View {
    var landmark: Landmark
    var body: some View {
        landmark.featureImage?
            .resizable()
            .overlay {
                TextOverlayView(landmark: landmark)
            }
    }
}


#Preview {
    FeatureCardView(landmark: DataStore().features[0])
        .aspectRatio(3/2, contentMode: .fit)
}
