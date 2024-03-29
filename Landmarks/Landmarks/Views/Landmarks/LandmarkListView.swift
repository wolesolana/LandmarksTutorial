//
//  LandmarksListView.swift
//  Landmarks
//
//  Created by Wole Solana on 2/14/24.
//

import SwiftUI

struct LandmarkListView: View {
    @Environment(DataStore.self) var dataStore
    @State private var showFavoritesOnly: Bool = false
    @State private var filter = FilterCategory.all
    @State private var selectedLandmark: Landmark?

    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"

        var id: FilterCategory { self }
    }

    var favoriteLandmarks: [Landmark] {
        dataStore.landmarks
            .filter { (!showFavoritesOnly || $0.isFavorite)
                && (filter == .all || filter.rawValue == $0.category.rawValue)
            }
    }

    var title: String {
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showFavoritesOnly ? "Favorite \(title)" : title
    }

    var index: Int? {
        dataStore.landmarks.firstIndex(where: { $0.id == selectedLandmark?.id })
    }

    var body: some View {
        @Bindable var dataStore = dataStore

        NavigationSplitView {
            List(selection: $selectedLandmark) {
                ForEach(favoriteLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetailView(landmark: landmark)
                    } label: {
                        LandmarkRowView(landmark: landmark)
                    }
                    .tag(landmark)
                }
            }
            .animation(.default, value: favoriteLandmarks)
            .navigationTitle(title)
            .frame(minWidth: 300)
            .toolbar {
                ToolbarItem {
                    Menu {
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(.inline)

                        Toggle(isOn: $showFavoritesOnly) {
                            Text("Favorites only")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
        } detail: {
            Text("Select a Landmark")
        }
        .focusedValue(\.selectedLandmark, $dataStore.landmarks[index ?? 0])
    }
}

#Preview {
    LandmarkListView()
        .environment(DataStore())
}
