//
//  TabBar.swift
//  Koala
//
//  Created by Sholihatul Richas on 25/10/21.
//

import SwiftUI

struct TabBar: View {
    @State var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab){
            HomepageView(categories: ["Healthy"])
                .tabItem{
                    selectedTab == 0 ? Image("discoveractive") : Image("discovergrey")
                    Text("Discover")
                }.tag(0)
            InfluencerListView()
                .tabItem{
                    selectedTab == 1 ? Image("influenceractive") : Image("influencergrey")
                    Text("influencer")
                }.tag(1)
            Image(systemName: "person")
                .tabItem{
                    selectedTab == 2 ? Image("orderactive") : Image("ordergrey")
                    Text("Orders")
                }.tag(2)
            Text("Homepage")
                .tabItem{
                    selectedTab == 3 ? Image("campaignactive") : Image("campaigngrey")
                    Text("Campaign")
                }.tag(3)
            Text("Homepage")
                .tabItem{
                    selectedTab == 4 ? Image("reportactive") : Image("reportgrey")
                    Text("Report")
                }.tag(4)
        }.accentColor(Color(UIColor(named: "primary")!))
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
