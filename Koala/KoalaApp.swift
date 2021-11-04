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
            

        }
    }
}
