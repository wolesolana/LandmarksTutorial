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

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Spacer()
                EditButton()
            }
            if editMode?.wrappedValue == .inactive {
                ProfileSummaryView(profile: dataStore.profile)
            } else {
                Text("Profile Editor")
            }
        }
        .padding()
    }
}

#Preview {
    ProfileHostView()
        .environment(DataStore())
}
