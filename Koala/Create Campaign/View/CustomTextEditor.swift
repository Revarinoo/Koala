//
//  CustomTextEditor.swift
//  Koala
//
//  Created by Sholihatul Richas on 03/11/21.
//

import SwiftUI

import SwiftUI
struct Demo: View {
     @State private var text = ""
    var body: some View {
        NavigationView {
                VStack(alignment: .leading){
                    Text("How are you feeing today?")
                        .font(.title)
                    CustomTextEditor.init(placeholder: "Start typing..", text: $text)
                        .font(.body)
                        .background(Color(UIColor.systemGray6))
                        .accentColor(.green)
                        .frame(height: 400)
                        .cornerRadius(8)
                    Spacer()
                }.padding()
    
            .navigationTitle("Navigation")
        }
    }
}

struct CustomTextEditor: View {
    let placeholder: String
    @Binding var text: String
    let internalPadding: CGFloat = 5
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            if text.isEmpty  {
                Text(placeholder)
                    .background(Color("lightGray"))
                    .cornerRadius(10)
                    .font(Font.custom(ThemeFont.poppinsMedium, size: 12))
                    .foregroundColor(Color.primary.opacity(0.25))
                    .padding(EdgeInsets(top: 7, leading: 4, bottom: 0, trailing: 0))
            }
            TextEditor(text: $text)
                .background(Color("lightGray"))
                .cornerRadius(10)
                .font(Font.custom(ThemeFont.poppinsMedium, size: 12))
                .cornerRadius(10)
        }.onAppear() {
            UITextView.appearance().textContainerInset =
                 UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
            UITextView.appearance().backgroundColor = UIColor(ThemeColor.background)
        }.onDisappear() {
            UITextView.appearance().textContainerInset =
                 UIEdgeInsets(top: 13, left: 12, bottom: 13, right: 14)
            UITextView.appearance().backgroundColor = UIColor(ThemeColor.background)
        }
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        Demo()
    }
}
