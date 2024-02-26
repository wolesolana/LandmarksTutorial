//
//  ProfileHostView.swift
//  Landmarks
//
//  Created by Wole Solana on 2/26/24.
//

import SwiftUI

struct ProfileHostView: View {
    @State private var draftProfile = Profile.default

    var body: some View {
        VStack {
            ProfileSummaryView(profile: draftProfile)
        }
        .padding()
    }
}

#Preview {
    ProfileHostView()
}
