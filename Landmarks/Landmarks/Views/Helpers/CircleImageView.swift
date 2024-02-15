//
//  CircleImageView.swift
//  Landmarks
//
//  Created by Wole Solana on 2/14/24.
//

import SwiftUI

struct CircleImageView: View {
    var image: Image
    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4.0)
            }
            .shadow(radius: 7.0)
    }
}

#Preview {
    CircleImageView(image: Image("turtlerock"))
}
