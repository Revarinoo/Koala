//
//  KoalaApp.swift
//  Koala
//
//  Created by Revarino Putra on 11/10/21.
//

import SwiftUI
import Firebase

@main
struct KoalaApp: App {
    @AppStorage("JWT", store: .standard) var token = ""
    @StateObject var tabBarVM = TabBarViewModel.shared
    @AppStorage("role", store: .standard) var role = ""
    
    init() {
//        if role != "" {
            FirebaseApp.configure()
//        }
        UIWindow.appearance().overrideUserInterfaceStyle = .light
    }
    
    var body: some Scene {
        WindowGroup {
<<<<<<< HEAD
//            PaymentView()
=======
//            PaymentView(order_id: 10)
>>>>>>> 974d75cdffc1617a10847e844bc5e7239454b664
            if token != "" {
                if role == "Business" {
                    TabBar(selectedTab: $tabBarVM.selectedTab).environment(\.colorScheme, .light)
                }
                else {
                    TabBarInfluencer(selectedTab: $tabBarVM.selectedTab).environment(\.colorScheme, .light)
                }
            }
            else {
                SplashScreen().environment(\.colorScheme, .light)
            }
<<<<<<< HEAD
=======
            
//            InputProfileView()
//            ProfileView()
>>>>>>> 974d75cdffc1617a10847e844bc5e7239454b664
        }
    }
}
