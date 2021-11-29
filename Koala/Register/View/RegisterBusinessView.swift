//
//  RegisterBusinessView.swift
//  Koala
//
//  Created by Revarino Putra on 23/10/21.
//

import SwiftUI

struct RegisterBusinessView: View {
    @StateObject var registerVM: RegisterViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello Friends,")
                .font(Font.custom(ThemeFont.poppinsSemiBold, size: 24))
            Text("Sign up to start your journey")
                .font(Font.custom(ThemeFont.poppinsSemiBold, size: 12))
                .foregroundColor(ThemeColor.grayDark)
                .padding(.bottom)
            Text("Name")
                .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                .foregroundColor(ThemeColor.grayDark)
            TextField("Enter your name", text: $registerVM.name)
                .textFieldStyle(OvalTextFieldStyle())
            Text("Email")
                .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                .foregroundColor(ThemeColor.grayDark)
            TextField("Enter your email", text: $registerVM.email)
                .textFieldStyle(OvalTextFieldStyle())
            Text("Password")
                .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                .foregroundColor(ThemeColor.grayDark)
            SecureInputView("Enter your password", text: $registerVM.password)
        }
    }
}

struct RegisterBusinessView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterBusinessView(registerVM: RegisterViewModel())
    }
}
