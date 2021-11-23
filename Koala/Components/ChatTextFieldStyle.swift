//
//  ChatTextFieldStyle.swift
//  Koala
//
//  Created by Jonathan Clive on 23/11/21.
//

import SwiftUI

struct ChatTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(5)
            .overlay(RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.init(hex: "A7A7A7"), lineWidth: 1))
    }
}
