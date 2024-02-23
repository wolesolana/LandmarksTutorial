//
//  CategoryItemView.swift
//  Landmarks
//
//  Created by Wole Solana on 2/21/24.
//

import SwiftUI

struct CategoryItemView: View {
    var landmark: Landmark

    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .foregroundStyle(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

#Preview {
    CategoryItemView(landmark: DataStore().landmarks[0])
}
