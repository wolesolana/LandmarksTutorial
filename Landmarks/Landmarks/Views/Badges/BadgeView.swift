//
//  BadgeView.swift
//  Landmarks
//
//  Created by Wole Solana on 2/20/24.
//

import SwiftUI

struct BadgeView: View {
    var badgeSymbols: some View {
        let numberOfBadges = 8
        return ForEach(0 ..< numberOfBadges, id: \.self) { index in
            let rotationAngle: Angle = .degrees(
                Double(index) / Double(numberOfBadges)
            ) * 360.0
            RotatedBadgeSymbol(
                angle: rotationAngle
            )
            .opacity(0.5)
        }
    }

    var body: some View {
        ZStack {
            BadgeBackground()
            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }
        .scaledToFit()
    }
}

#Preview {
    BadgeView()
}
