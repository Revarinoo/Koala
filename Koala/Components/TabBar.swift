//
//  TabBar.swift
//  Koala
//
//  Created by Sholihatul Richas on 25/10/21.
//  Edited by Syahrul F & Reva

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Int
    
    init(selectedTab: Binding<Int>) {
        _selectedTab = selectedTab
        UITabBar.appearance().backgroundColor = UIColor(ThemeColor.background)
    }
    
    
    var body: some View {
        
        TabView(selection: $selectedTab){
                HomepageView()
                    .tabItem{
                        selectedTab == 0 ? Image("discoveractive") : Image("discovergrey")
                        Text("Discover")
                    }.tag(0)
                InfluencerListView(showBackButton: false)
                    .tabItem{
                        selectedTab == 1 ? Image("influenceractive") : Image("influencergrey")
                        Text("Influencer")
                    }.tag(1)
                OrderView()
                    .tabItem{
                        selectedTab == 2 ? Image("orderactive") : Image("ordergrey")
                        Text("Orders")
                    }.tag(2)
                CampaignView()
                    .tabItem{
                        selectedTab == 3 ? Image("campaignactive") : Image("campaigngrey")
                        Text("Campaign")
                    }.tag(3)
                BusinessReportView()
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

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(selectedTab: .constant(1))
    }
}
