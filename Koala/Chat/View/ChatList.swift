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
    @StateObject var chatRoomVM = ChatRoomViewModel()
    static let shared = ChatList()
    
    var body: some View {
        
        if role == "Business" {
            chatContent
        } else {
            NavigationView {
                chatContent
            }
        }
    }
    
    var chatContent: some View {
        VStack {
            Divider().background(Color.init(hex: "A7A7A7"))
            
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
        .background(Color.bgColorView.ignoresSafeArea())
        .navigationTitle("Chats")
        .navigationBarTitleDisplayMode(.large)
        .onAppear(perform: {
            chatRoomVM.fetchData()
        })
    }
}

struct ChatList_Previews: PreviewProvider {
    static var previews: some View {
        ChatList()
    }
}

