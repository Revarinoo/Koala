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
                ForEach(chatRoomVM.chatData, id: \.id) { data in
                    NavigationLink(destination: PersonalChat(chatRoom: data.chatRooms)) {
                        HStack {
                            WebImage(url: URL(string: data.targetUser.photo))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 45, height: 45)
                                .clipShape(Circle())
                            Text("\(data.targetUser.name)")
                        }
                    }
                }
            }
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

