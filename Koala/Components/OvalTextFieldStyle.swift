//
//  OvalTextFieldStyle.swift
//  Koala
//
//  Created by Jonathan Clive on 20/10/21.
//

import SwiftUI
import Combine
struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(15)
            .background(Color("lightGray"))
            .cornerRadius(10)
            .font(Font.custom(ThemeFont.poppinsMedium, size: 12))
            .padding(.bottom, 5)
            .padding(.top, -5)
    }
}

struct OvalTextFieldStyleForm: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(15)
            .background(Color("lightGray"))
            .cornerRadius(10)
            .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
            .padding(.bottom, 5)
            .padding(.top, -5)
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
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(ThemeColor.grayDark.opacity(0.65))
                    .padding(EdgeInsets(top: 7, leading: 4, bottom: 0, trailing: 0))
                    .padding(internalPadding)
            }
            TextEditor(text: $text)
                .padding(internalPadding)
        }.onAppear() {
            UITextView.appearance().backgroundColor = .clear
        }.onDisappear() {
            UITextView.appearance().backgroundColor = nil
        }
    }
}

