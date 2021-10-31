//
//  KoalaApp.swift
//  Koala
//
//  Created by Revarino Putra on 11/10/21.
//

import SwiftUI

@main
struct KoalaApp: App {
    
    @AppStorage("isNewUser") var isNewUser: Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isNewUser {
                SplashScreen()
            } else {
                HomepageView(categories: ["Coffee"])
            }
        }
    }
}
