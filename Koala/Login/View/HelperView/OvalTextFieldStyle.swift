//
//  OvalTextFieldStyle.swift
//  Koala
//
//  Created by Jonathan Clive on 20/10/21.
//

import SwiftUI

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(Color("lightGray"))
            .cornerRadius(10)
            .font(Font.custom(ThemeFont.poppinsMedium, size: 12))
            .padding(.bottom, 5)
            .padding(.top, -5)
    }
}
