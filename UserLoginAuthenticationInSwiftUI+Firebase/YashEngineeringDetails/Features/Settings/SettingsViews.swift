//
//  SettingsViews.swift
//  YashEngineering
//
//  Created by Jiva Ram on 24/05/25.
//

import SwiftUI

struct SettingsViews: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
       @AppStorage("notificationsEnabled") private var notificationsEnabled = true

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Appearance")) {
                    Toggle(isOn: $isDarkMode) {
                        Label("Dark Mode", systemImage: "moon.fill")
                    }
                }
                Section(header: Text("Notifications")) {
                    Toggle(isOn: $notificationsEnabled) {
                        Label("Enable Notifications", systemImage: "bell.fill")
                    }
                }
                Section {
                    Button(role: .destructive) {
                        // Add logout logic here
                    } label: {
                        Label("Log Out", systemImage: "arrow.backward.square")
                    }
                }
            }
        }
    }
}

#Preview {
    SettingsViews()
}
