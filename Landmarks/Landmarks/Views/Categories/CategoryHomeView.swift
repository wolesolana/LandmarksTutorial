//
//  CategoryHomeView.swift
//  Landmarks
//
//  Created by Wole Solana on 2/21/24.
//

import SwiftUI

struct CategoryHomeView: View {
    @Environment(DataStore.self) var dataStore
    var body: some View {
        NavigationSplitView {
            List {
                dataStore.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())

                ForEach(
                    dataStore.categories.keys.sorted(),
                    id: \.self
                ) { category in
                    CategoryRowView(
                        categoryName: category,
                        items: dataStore.categories[category]!
                    )
                }
                .listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
            }
            .navigationTitle("Featured")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    CategoryHomeView()
        .environment(DataStore())
}
