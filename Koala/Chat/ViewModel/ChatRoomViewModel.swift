//
//  ChatRoomViewModel.swift
//  Koala
//
//  Created by Revarino Putra on 19/11/21.
//

import Foundation
import Firebase
import SwiftUI


class ChatRoomViewModel: ObservableObject {
    @Published var chatRooms: [ChatRoom] = []
    private var db = Firestore.firestore()
    private var userService = UserProfileService()
    @Published var chatData: [ChatData] = []
    @State var userVM = UserProfileViewModel.shared
    @AppStorage("role", store: .standard) var role = "Influencer"
    
    func fetchData() {
        db.collection("chatrooms").whereField("users", arrayContains: userVM.user.id).addSnapshotListener { snapshot, error in
                guard let documents = snapshot?.documents else {
                    return
                }
                self.chatRooms = documents.map({ docSnaphot -> ChatRoom in
                    let data = docSnaphot.data()
                    let docId = docSnaphot.documentID
                    let users = data["users"] as? [Int] ?? []
                    self.getUser(id: users[self.role == "Business" ? 1 : 0]) { data in
                        DispatchQueue.main.async {
                            self.chatData.append(ChatData(chatRooms: ChatRoom(id: docId, users: users), targetUser: data))
                        }
                    }
                    return ChatRoom(id: docId, users: users)
                })
                
            }
    }
    
    func createChatRoom(target: Int) -> Bool {
        if isCreated(user: userVM.user.id, target: target) { return false }
        db.collection("chatrooms").addDocument(data: ["users": [userVM.user.id, target]]) { err in
            if let err = err {
                print(err.localizedDescription)
            }
        }
        return true
    }
    
    private func isCreated(user: Int, target: Int) -> Bool {
        for chatroom in chatRooms {
            if chatroom.users.contains(user) && chatroom.users.contains(target) {
                return true
            }
        }
        return false
    }
    
    func getUser(id: Int, completion: @escaping(_ data: ProfileChat)->Void) {
        userService.getSpecificUserProfile(userId: id) { result in
            if let name = result?.name, let photo = result?.photo {
                completion(.init(name: name, photo: photo))
            }
        }
    }
    
}
