//
//  PersonalChat.swift
//  Koala
//
//  Created by Revarino Putra on 19/11/21.
//

import SwiftUI

struct PersonalChat: View {
    let chatRoom: ChatRoom
    @ObservedObject var messagesVM = MessageViewModel()
    @State var messageField = ""
    
    init(chatRoom: ChatRoom) {
        self.chatRoom = chatRoom
        messagesVM.fetchData(docId: chatRoom.id)
    }
    
    var body: some View {
        VStack {
            List(messagesVM.messages) { message in
                HStack {
                    Text(message.content)
                    Spacer()
                }
            }
            
            HStack {
                TextField("Enter Message ....", text: $messageField)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    messagesVM.sendMessage(content: messageField, docId: chatRoom.id)
                }, label: {
                    Text("Send")
                })
            }
        }
        
    }
}

struct PersonalChat_Previews: PreviewProvider {
    static var previews: some View {
        PersonalChat(chatRoom: ChatRoom(id: "1", users: [1,2]))
    }
}
