//
//  TabBar.swift
//  Koala
//
//  Created by Sholihatul Richas on 25/10/21.
//  Edited by Syahrul F & Reva

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Int
    @AppStorage("JWT", store: .standard) var token = ""
    @Environment(\.presentationMode) var presentationMode
    @StateObject var tabBarVM = TabBarViewModel.shared
    init(selectedTab: Binding<Int>) {
        _selectedTab = selectedTab
        UITabBar.appearance().backgroundColor = UIColor(ThemeColor.background)
    }
    
    
    var body: some View {
        
        TabView(selection: $tabBarVM.selectedTab){
                HomepageView()
                    .tabItem{
                        tabBarVM.selectedTab == 0 ? Image("discoveractive") : Image("discovergrey")
                        Text("Discover")
                    }.tag(0)
                
                InfluencerListView(showBackButton: false)
                    .tabItem{
                        tabBarVM.selectedTab == 1 ? Image("influenceractive") : Image("influencergrey")
                        Text("Influencer")
                    }.tag(1)
                OrderView()
                    .tabItem{
                        tabBarVM.selectedTab == 2 ? Image("orderactive") : Image("ordergrey")
                        Text("Orders")
                    }.tag(2)
                CampaignView()
                    .tabItem{
                        tabBarVM.selectedTab == 3 ? Image("campaignactive") : Image("campaigngrey")
                        Text("Campaign")
                    }.tag(3)
                BusinessReportView()
                    .tabItem{
                        tabBarVM.selectedTab == 4 ? Image("reportactive") : Image("reportgrey")
                        Text("Report")
                    }.tag(4)
            }
            .accentColor(Color(UIColor(named: "primary")!))
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(selectedTab: .constant(1))
    }
}

struct TabBarNotLoggedIn: View {
    
    @Binding var selectedTab: Int
    @AppStorage("JWT", store: .standard) var token = ""
    @Environment(\.presentationMode) var presentationMode
    init(selectedTab: Binding<Int>) {
        _selectedTab = selectedTab
        UITabBar.appearance().backgroundColor = UIColor(ThemeColor.background)
        //UITabBarAppearance().accentColor = UIColor(ThemeColor.primary)
    }
    
    
    var body: some View {
        
        TabView(selection: $selectedTab){
                HomepageView()
                    .tabItem{
                        selectedTab == 0 ? Image("discoveractive") : Image("discovergrey")
                        Text("Discover")
                    }.tag(0)
                
                LoginFromTabBar()
                    .tabItem{
                        selectedTab == 1 ? Image("influenceractive") : Image("influencergrey")
                        Text("Influencer")
                    }.tag(1)
                LoginFromTabBar()
                    .tabItem{
                        selectedTab == 2 ? Image("orderactive") : Image("ordergrey")
                        Text("Orders")
                    }.tag(2)
                LoginFromTabBar()
                    .tabItem{
                        selectedTab == 3 ? Image("campaignactive") : Image("campaigngrey")
                        Text("Campaign")
                    }.tag(3)
                LoginFromTabBar()
                    .tabItem{
                        selectedTab == 4 ? Image("reportactive") : Image("reportgrey")
                        Text("Report")
                    }.tag(4)
            }
            .accentColor(Color(UIColor(named: "primary")!))
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}
