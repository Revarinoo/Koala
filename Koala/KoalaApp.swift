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
    
    var body: some Scene {
        WindowGroup {
//<<<<<<< HEAD
//            if token != "" {
//                TabBar()
//            }
//            else {
//                SplashScreen()
//            }
//            RegisterView()
//            OrderView()
//            InfluencerDetailView()
//            LoginView()
            CreateCampaign()
            //TabBar()
  //          LoadingView()
//=======
//            if token != "" {
//                TabBar(selectedTab: 0)
//            }
//            else {
//                SplashScreen()
//            }
//>>>>>>> aaea0c617753ed8c11598271e38795e0b011dbe4

        }
    }
}
