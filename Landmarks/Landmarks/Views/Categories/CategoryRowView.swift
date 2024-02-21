//
//  CategoryRowView.swift
//  Landmarks
//
//  Created by Wole Solana on 2/21/24.
//

import SwiftUI

struct CategoryRowView: View {
    var categoryName: String
    var items: [Landmark]

    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        CategoryItemView(landmark: landmark)
                    }
                }
            }
        }
        .frame(height: 185)
    }
}

#Preview {
    let landmarks = DataStore().landmarks
    return CategoryRowView(
        categoryName: landmarks[0].category.rawValue,
        items: Array(landmarks.prefix(4))
    )
}
