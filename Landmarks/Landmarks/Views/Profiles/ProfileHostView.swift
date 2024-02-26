//
//  ProfileHostView.swift
//  Landmarks
//
//  Created by Wole Solana on 2/26/24.
//

import SwiftUI

struct ProfileHostView: View {
    @Environment(\.editMode) var editMode
    @Environment(DataStore.self) var dataStore
    @State private var draftProfile = Profile.default

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Spacer()
                EditButton()
            }
            if editMode?.wrappedValue == .inactive {
                ProfileSummaryView(profile: dataStore.profile)
            } else {
                ProfileEditorView(profile: $draftProfile)
            }
        }
        .padding()
    }
}

#Preview {
    ProfileHostView()
        .environment(DataStore())
}
