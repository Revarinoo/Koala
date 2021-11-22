//
//  ChatList.swift
//  Koala
//
//  Created by Revarino Putra on 19/11/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ChatList: View {
    @StateObject var chatRoomVM = ChatRoomViewModel()
    
    var body: some View {
        NavigationView {
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
            .background(Color.bgColorView)
            .navigationTitle("Chats")
            
        }
        .onAppear {
            chatRoomVM.fetchData()
        }
    }
    
    
}

struct ChatList_Previews: PreviewProvider {
    static var previews: some View {
        ChatList()
    }
}

