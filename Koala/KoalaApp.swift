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
    @AppStorage("role", store: .standard) var role = ""
    
    init() {
        UIWindow.appearance().overrideUserInterfaceStyle = .light
    }
    
    var body: some Scene {
        WindowGroup {
            PaymentProcessView()
//            if token != "" {
//                if role == "Business" {
//                    TabBar(selectedTab: $tabBarVM.selectedTab).environment(\.colorScheme, .light)
//                }
//                else {
//                    TabBarInfluencer(selectedTab: $tabBarVM.selectedTab).environment(\.colorScheme, .light)
//                }
//            }
//            else {
//                SplashScreen().environment(\.colorScheme, .light)
//            }
        }
    }
}
