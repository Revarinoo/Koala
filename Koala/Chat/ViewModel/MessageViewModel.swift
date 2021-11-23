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
    static let shared = MessageViewModel()
    @Published var messages: [Message] = []
    private let db = Firestore.firestore()
    @State var userVM = UserProfileViewModel.shared
    @Published var lastMessage = ""
    
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
            
            DispatchQueue.main.async {
                self.messages = documents.map({ docSnapShot -> Message in
                    let data = docSnapShot.data()
                    let docId = docSnapShot.documentID
                    let content = data["content"] as? String ?? ""
                    let sender = data["sender"] as? Int ?? 0
                    let sentAt = (data["sentAt"] as? Timestamp)?.dateValue() ?? Date()
                    return Message(id: docId, content: content, sender: sender, sentAt: sentAt)
                })
            }
        }
    }
    
    func getSectionMessages (for messages: [Message]) -> [[Message]] {
        var res = [[Message]]()
        var tmp = [Message]()
        
        for message in messages {
            if let firstMessage = tmp.first {
                let daysBetween = firstMessage.sentAt.daysBetween(date: message.sentAt)
                if daysBetween >= 1 {
                    res.append(tmp)
                    tmp.removeAll()
                    tmp.append(message)
                } else {
                    tmp.append(message)
                }
            } else {
                tmp.append(message)
            }
        }
        res.append(tmp)
        return res
    }
}
