//
//  TabBarViewModel.swift
//  Koala
//
//  Created by Revarino Putra on 15/11/21.
//

import Foundation

class TabBarViewModel: ObservableObject {
    static let shared = TabBarViewModel()
    @Published var selectedTab = 0
}
class TabBarViewModelNotLoggedIn: ObservableObject {
    static let shared = TabBarViewModel()
    @Published var selectedTab = 0
}

class TabBarViewModelInfluencer: ObservableObject {
    static let shared = TabBarViewModelInfluencer()
    @Published var selectedTab = 0
    @Published var titleBar = ""
    
    init(){
        getTitleBar()
    }
    
    func getTitle() -> String {
        if self.selectedTab == 0 {
            return "Order List"
        } else if self.selectedTab == 1 {
            return "Chat"
        } else {
            return "Profile"
        }
    }
    func getTitleBar() {
        if self.selectedTab == 0 {
            self.titleBar =  "Order List"
        } else if self.selectedTab == 1 {
            self.titleBar =  "Chat"
        } else {
            self.titleBar =  "Profile"
        }
    }
}
