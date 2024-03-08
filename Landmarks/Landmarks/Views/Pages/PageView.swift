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
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControlView(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
        .aspectRatio(3/2, contentMode: .fit)
    }
}

#Preview {
    PageView(pages: DataStore().features.map { FeatureCardView(landmark: $0) })
}
