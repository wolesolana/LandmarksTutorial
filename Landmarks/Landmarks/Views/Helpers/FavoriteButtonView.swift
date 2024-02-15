//
//  FavoriteButtonView.swift
//  Landmarks
//
//  Created by Wole Solana on 2/15/24.
//

import SwiftUI

struct FavoriteButtonView: View {
    @Binding var isSet: Bool
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .yellow : .gray)
        }
    }
}

#Preview {
    FavoriteButtonView(isSet: .constant(true))
}
