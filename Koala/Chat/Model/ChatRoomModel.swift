//
//  ChatRoomModel.swift
//  Koala
//
//  Created by Revarino Putra on 19/11/21.
//

import Foundation

struct ChatRoom: Codable, Identifiable {
    var id: String
    var users: [Int]
}

struct Message: Codable, Identifiable {
    var id: String?
    var content: String
    var sender: Int
    var sentAt: Date
}

struct ProfileChat : Identifiable {
    var id = UUID()
    var name: String
    var photo: String
}

struct ChatData: Identifiable {
    let id = UUID()
    let chatRooms: ChatRoom
    let targetUser: ProfileChat
}
