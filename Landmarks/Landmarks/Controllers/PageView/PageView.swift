//
//  PageView.swift
//  Landmarks
//
//  Created by Wole Solana on 3/4/24.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    var body: some View {
        PageViewController(pages: pages)
            .aspectRatio(3/2, contentMode: .fit)
    }
}

#Preview {
    PageView(pages: DataStore().features.map { FeatureCardView(landmark: $0) })
}
