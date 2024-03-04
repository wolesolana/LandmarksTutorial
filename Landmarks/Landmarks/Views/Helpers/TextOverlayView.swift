//
//  TextOverlayView.swift
//  Landmarks
//
//  Created by Wole Solana on 3/4/24.
//

import SwiftUI

struct TextOverlayView: View {
    var landmark: Landmark

    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            }
            .padding()
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    TextOverlayView(landmark: DataStore().landmarks[0])
}
