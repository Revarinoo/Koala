//
//  SecureInputView.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 23/10/21.
//

import SwiftUI

struct SecureInputView: View {
    
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            if isSecured {
                SecureField(title, text: $text)
                    .textFieldStyle(OvalTextFieldStyle())
            } else {
                TextField(title, text: $text)
                    .textFieldStyle(OvalTextFieldStyle())
            }
            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(.gray)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 10))
            }
        }
    }
}
