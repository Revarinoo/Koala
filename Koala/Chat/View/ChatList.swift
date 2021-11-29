//
//  ChatList.swift
//  Koala
//
//  Created by Revarino Putra on 19/11/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ChatList: View {
    
    @AppStorage("role", store: .standard) var role = ""
    @StateObject var chatRoomVM = ChatRoomViewModel.shared
    static let shared = ChatList()
    @StateObject var tabBarVM = TabBarViewModelInfluencer.shared
    @StateObject var updateProfileVM = InfluencerProfileViewModel()
    @State var showUpdateProfile = false
    @State var updateProfileSheet = false
    
    var body: some View {
        
        if role == "Business" {
            chatContent
        } else {
            //NavigationView {
                chatContent
            //}
        }
    }
    
    var chatContent: some View {
        VStack {
            Divider().background(Color.init(hex: "A7A7A7"))
            if showUpdateProfile{
                Spacer()
                UpdateProfileInfluencer(showSheet: $updateProfileSheet)
                Spacer()
            } else {
                ScrollView (.vertical, showsIndicators: false){
                    VStack {
                        ForEach(chatRoomVM.chatData, id: \.id) { data in
                            NavigationLink(destination: PersonalChat(chatRoom: data.chatRooms, personName: data.targetUser.name, photoURL: data.targetUser.photo)) {
                                ChatListChildView(chatroomId: data.chatRooms.id, photoURL: data.targetUser.photo, name: data.targetUser.name)
                            }
                            Divider().background(Color.init(hex: "E4E4E4"))
                        }
                    }
                }
            }
        }
        .background(Color.bgColorView.ignoresSafeArea())
        .navigationTitle("\(tabBarVM.titleBar)")
        .navigationBarTitleDisplayMode(.large)
        .onAppear(perform: {
            chatRoomVM.fetchData()
            self.dismissKeyboard()
            updateProfileVM.callInfluencerData()
            if updateProfileVM.influencerProfile.location == ""{
                showUpdateProfile = true
            }
        })
        .sheet(isPresented: $updateProfileSheet){
            InputProfileView(isPresent: $updateProfileSheet)
        }
    }
}

struct ChatList_Previews: PreviewProvider {
    static var previews: some View {
        ChatList()
    }
}

