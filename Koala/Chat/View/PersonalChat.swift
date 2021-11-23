//
//  PersonalChat.swift
//  Koala
//
//  Created by Revarino Putra on 19/11/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct PersonalChat: View {
    let chatRoom: ChatRoom
    let personName: String
    let photoURL: String
    @ObservedObject var messagesVM = MessageViewModel.shared
    @State var messageField = ""
    @State private var messageIDScroll: String?
    @State var first: Bool = true
    
    init(chatRoom: ChatRoom, personName: String, photoURL: String) {
        self.chatRoom = chatRoom
        self.personName = personName
        self.photoURL = photoURL
        messagesVM.fetchData(docId: chatRoom.id)
        print("done")
    }
    
    var body: some View {
        VStack {
            Divider().background(Color.init(hex: "A7A7A7"))
            
            GeometryReader { reader in
                ScrollView {
                    ScrollViewReader { scrollReader in
                        messageView(viewWidth: reader.size.width)
                            .padding(.horizontal)
                            .onChange(of: messageIDScroll) { _ in
                                if let messageID = messageIDScroll {
                                    scrollTo(messageID: messageID, shouldAnimate: true, scrollReader: scrollReader)
                                }
                            }
                            .onAppear {
                                if let messageID = messagesVM.messages.last?.id {
                                    scrollTo(messageID: messageID, shouldAnimate: true, scrollReader: scrollReader)
                                }
                            }
                    }
                }
            }
            
            HStack {
                TextField("Text Message...", text: $messageField)
                    .textFieldStyle(ChatTextFieldStyle())
                
                withAnimation {
                    Button(action: {
                        messagesVM.sendMessage(content: messageField, docId: chatRoom.id)
                        self.messageField = ""
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                            messageIDScroll = messagesVM.messages.last?.id
                        })
                    }, label: {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(.white)
                            .frame(width: 35, height: 35)
                            .background(
                                Circle()
                                    .foregroundColor(.orange)
                                    .opacity(messageField.isEmpty ? 0.5 : 1)
                            )
                    })
                        .disabled(messageField.isEmpty)
                }
            }
            .padding(10)
        }
        .navigationTitle(personName)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.bgColorView)
        
    }
    
    let columns = [GridItem(.flexible(minimum: 10))]
    
    func messageView(viewWidth: CGFloat) -> some View {
        LazyVGrid(columns: columns, spacing: 0) {
            let sectionMessages = messagesVM.getSectionMessages(for: messagesVM.messages)
            ForEach(sectionMessages.indices, id: \.self) { sectionIndex in
                let messages = sectionMessages[sectionIndex]
                Section(header: Text(messages.first!.sentAt.descriptiveString(dateStyle: .medium, inChat: true)).font(.system(size: 13.5)).foregroundColor(Color.init(hex: "999999")).padding(10)) {
                    ForEach(messages) { message in
                        let isUser = message.sender == messagesVM.userVM.user.id
                        HStack {
//                            if !isUser {
//                                if true {
//                                    WebImage(url: URL(string: photoURL))
//                                        .resizable()
//                                        .scaledToFill()
//                                        .frame(width: 40, height: 40)
//                                        .clipShape(Circle())
//
//                                } else {
//                                    Text("")
//                                        .padding(.leading, 40)
//                                }
//                            } else {
//                                self.first = true
//                            }
                            ZStack{
                                Text(message.content)
                                    .padding(.horizontal)
                                    .padding(.vertical, 12)
                                    .background(isUser ? Color.init(hex: "FFDED4") : Color.white)
                                    .cornerRadius(15, corners: isUser ? [.topLeft, .bottomLeft, .bottomRight] : [.topRight, .bottomLeft, .bottomRight])
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: isUser ? . trailing : .leading)
                        .padding(.vertical, 3)
                        .id(message.id)
                    }
                }
            }
            
        }
    }
    
    func scrollTo(messageID: String, anchor: UnitPoint? = nil, shouldAnimate: Bool, scrollReader: ScrollViewProxy) {
        DispatchQueue.main.async {
            withAnimation(shouldAnimate ? Animation.easeIn: nil) {
                scrollReader.scrollTo(messageID, anchor: anchor)
            }
        }
    }
}

struct PersonalChat_Previews: PreviewProvider {
    static var previews: some View {
        PersonalChat(chatRoom: ChatRoom(id: "1", users: [1,2]), personName: "nama", photoURL: "")
    }
}

class TextFieldWithPadding: UITextField {
    var textPadding = UIEdgeInsets(
        top: 10,
        left: 20,
        bottom: 10,
        right: 20
    )
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}
