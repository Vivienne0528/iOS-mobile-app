//
//  GeothermalApp.swift
//  Geothermal
//
//  Created by Yuntian Wan on 13/4/2023.
//

import SwiftUI

@main
struct GeothermalApp: App {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @StateObject var colorSchemeManager = ColorSchemeManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
                .environmentObject(colorSchemeManager)
        }
    }
}
