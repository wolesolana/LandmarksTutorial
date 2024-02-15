//
//  LandmarkRowView.swift
//  Landmarks
//
//  Created by Wole Solana on 2/14/24.
//

import SwiftUI

struct LandmarkRowView: View {
    var landmark: Landmark
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
        }
    }
}

#Preview {
    Group {
        LandmarkRowView(landmark: landmarks[0])
        LandmarkRowView(landmark: landmarks[1])
    }
}
