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
                ForEach(dataStore.categories.keys.sorted(), id: \.self) { category in
                    Text(category)
                        .navigationTitle("Featured")
                }
            }
        } detail: {
            Text("Detail")
        }
    }
}

#Preview {
    CategoryHomeView()
        .environment(DataStore())
}
