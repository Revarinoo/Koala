//
//  KoalaApp.swift
//  Koala
//
//  Created by Revarino Putra on 11/10/21.
//

import SwiftUI

@main
struct KoalaApp: App {
    @AppStorage("JWT", store: .standard) var token = ""
    @StateObject var tabBarVM = TabBarViewModel.shared
    init() {
        UIWindow.appearance().overrideUserInterfaceStyle = .light
    }
    
    var body: some Scene {
        WindowGroup {
            if token != "" {
                TabBar(selectedTab: $tabBarVM.selectedTab).environment(\.colorScheme, .light)
            }
            else {
                SplashScreen().environment(\.colorScheme, .light)
            }
           // InfluencerListView()
        }
    }
}
