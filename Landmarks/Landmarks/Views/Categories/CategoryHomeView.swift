//
//  CategoryHomeView.swift
//  Landmarks
//
//  Created by Wole Solana on 2/21/24.
//

import SwiftUI

struct CategoryHomeView: View {
    @Environment(DataStore.self) var dataStore
    @State private var showingProfile = false

    var body: some View {
        NavigationSplitView {
            List {
                PageView(pages: dataStore.features.map { FeatureCardView(landmark: $0) })
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
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHostView()
                    .environment(dataStore)
            }
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    CategoryHomeView()
        .environment(DataStore())
}
