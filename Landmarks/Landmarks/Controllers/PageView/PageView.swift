//
//  PageView.swift
//  Landmarks
//
//  Created by Wole Solana on 3/4/24.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 0
    var body: some View {
        VStack {
            PageViewController(pages: pages, currentPage: $currentPage)
        }
        .aspectRatio(3/2, contentMode: .fit)
    }
}

#Preview {
    PageView(pages: DataStore().features.map { FeatureCardView(landmark: $0) })
}
