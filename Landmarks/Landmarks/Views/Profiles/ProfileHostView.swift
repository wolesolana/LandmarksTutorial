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
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = dataStore.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            if editMode?.wrappedValue == .inactive {
                ProfileSummaryView(profile: dataStore.profile)
            } else {
                ProfileEditorView(profile: $draftProfile)
                    .onAppear {
                        draftProfile = dataStore.profile
                    }
                    .onDisappear {
                        dataStore.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}

#Preview {
    ProfileHostView()
        .environment(DataStore())
}
