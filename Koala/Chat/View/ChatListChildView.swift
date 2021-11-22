//
//  ChatListChildView.swift
//  Koala
//
//  Created by Jonathan Clive on 22/11/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ChatListChildView: View {
    let chatroomId: String
    let photoURL: String
    let name: String
    var lastMessage: String
    
    @ObservedObject var messagesVM = MessageViewModel.shared
    
    init(chatroomId: String, photoURL: String, name: String){
        self.chatroomId = chatroomId
        self.photoURL = photoURL
        self.name = name
        self.lastMessage = ""
        messagesVM.fetchData(docId: chatroomId)
    }
    
    var body: some View {
        HStack {
            WebImage(url: URL(string: photoURL))
                .resizable()
                .scaledToFill()
                .frame(width: 45, height: 45)
                .clipShape(Circle())
            HStack {
                VStack (alignment: .leading) {
                    Text("\(name)")
                        .font(.system(size: 15))
                        .foregroundColor(.black)
                    Text("\(messagesVM.messages.last?.content ?? "")")
                        .font(.system(size: 12))
                        .foregroundColor(Color.init(hex: "999999"))
                }
                Spacer()
                VStack (alignment: .trailing) {
                    Text("\(messagesVM.messages.last?.sentAt.descriptiveString(inChat: false) ?? Date().descriptiveString(inChat: false))")
                        .font(.system(size: 12))
                        .foregroundColor(Color.init(hex: "999999"))
                    ZStack {
                        Circle()
                            .fill(.orange)
                            .padding(0)
                        Text("").font(.system(size: 9))
                            .foregroundColor(.white)
                    }
                        .frame(width: 16, height: 16)
                        .padding(.top, -5)
                }
            }
        }
        .padding()
        .frame(minWidth: 390, maxHeight: 85)
        
    }
}

struct ChatListChildView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListChildView(chatroomId: "1", photoURL: "foto", name: "Nama").previewLayout(.sizeThatFits)
    }
}

extension Date {
    func descriptiveString(dateStyle: DateFormatter.Style = .short, inChat: Bool) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = dateStyle
        
        let daysBetween = self.daysBetween(date: Date())
        
        if daysBetween == 0 {
            if inChat {
                return "Today"
            } else {
                formatter.dateStyle = .none
                formatter.timeStyle = .short
                formatter.string(from: self)
            }
        } else if daysBetween == 1 {
            return "Yesterday"
        } else if daysBetween < 5 {
            let weekdayIndex = Calendar.current.component(.weekday, from: self) - 1
            return formatter.weekdaySymbols[weekdayIndex]
        }
        return formatter.string(from: self)
    }
    
    func daysBetween(date: Date) -> Int {
        let calendar = Calendar.current
        let date1 = calendar.startOfDay(for: self)
        let date2 = calendar.startOfDay(for: date)
        if let daysBetween = calendar.dateComponents([.day], from: date1, to: date2).day {
            return daysBetween
        }
        return 0
    }
}
