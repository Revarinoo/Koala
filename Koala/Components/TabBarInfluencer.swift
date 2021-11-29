//
//  TabBarInfluencer.swift
//  Koala
//
//  Created by Revarino Putra on 22/11/21.
//

import SwiftUI

struct TabBarInfluencer: View {
    
    @Binding var selectedTab: Int
    @StateObject var tabBarVM = TabBarViewModelInfluencer.shared

    init(selectedTab: Binding<Int>) {
            _selectedTab = selectedTab
            UITabBar.appearance().backgroundColor = UIColor(ThemeColor.background)
        }
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab){
                OrderListView()
                        .tabItem{
                            selectedTab == 0 ? Image(systemName: "list.star") : Image(systemName: "list.bullet")
                            Text("Order")
                        }.tag(0)
                ChatList.shared
                        .tabItem{
                            selectedTab == 1 ? Image(systemName: "message.fill") : Image(systemName: "message")
                            Text("Chat")
                        }.tag(1)
                ProfileView()
                    .tabItem{
                        selectedTab == 2 ? Image(systemName: "person.fill") : Image(systemName: "person")
                        Text("Profile")
                    }.tag(2)
                }
                .accentColor(Color(UIColor(named: "primary")!))
                .navigationBarTitle("\(tabBarVM.getTitle())")
                //.navigationBarHidden(true)
                //.navigationBarBackButtonHidden(true)
        }
    }
}

struct TabBarInfluencer_Previews: PreviewProvider {
    static var previews: some View {
        TabBarInfluencer(selectedTab: .constant(1))
    }
}
