//
//  MessagesViewModel.swift
//  Koala
//
//  Created by Revarino Putra on 19/11/21.
//

import Foundation
import Firebase
import SwiftUI

class MessageViewModel: ObservableObject {
    @Published var messages: [Message] = []
    private let db = Firestore.firestore()
    @State var userVM = UserProfileViewModel.shared
    
    func sendMessage(content: String, docId: String) {
        db.collection("chatrooms").document(docId).collection("messages").addDocument(data: [
            "sentAt": Date(),
            "sender": userVM.user.id,
            "content": content
        ])
    }
    
    func fetchData(docId: String) {
        db.collection("chatrooms").document(docId).collection("messages").order(by: "sentAt", descending: false).addSnapshotListener { snapShot, error in
            guard let documents = snapShot?.documents else {
                return
            }
            
            self.messages = documents.map({ docSnapShot -> Message in
                let data = docSnapShot.data()
                let docId = docSnapShot.documentID
                let content = data["content"] as? String ?? ""
                let sender = data["sender"] as? Int ?? 0
                return Message(id: docId, content: content, sender: sender)
            })
        }
    }
}
