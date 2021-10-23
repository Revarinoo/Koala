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
            Text("Welcome")
                .font(Font.custom(ThemeFont.poppinsSemiBold, size: 24))
            Text("Hello friends, sign up to continue")
                .font(Font.custom(ThemeFont.poppinsSemiBold, size: 12))
                .foregroundColor(Color("darkGray"))
                .padding(.bottom)
            Text("Name")
                .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                .foregroundColor(Color("darkGray"))
            TextField("Enter your name", text: $registerVM.name)
                .textFieldStyle(OvalTextFieldStyle())
            Text("Email")
                .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                .foregroundColor(Color("darkGray"))
            TextField("Enter your email", text: $registerVM.email)
                .textFieldStyle(OvalTextFieldStyle())
            Text("Password")
                .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                .foregroundColor(Color("darkGray"))
            SecureField("Enter your password", text: $registerVM.password)
                .textFieldStyle(OvalTextFieldStyle())
            Text("Confirm Password")
                .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                .foregroundColor(Color("darkGray"))
            SecureField("Enter your password confirmation", text: $registerVM.passwordConfirm)
                .textFieldStyle(OvalTextFieldStyle())
        }
    }
}

struct RegisterBusinessView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterBusinessView(registerVM: RegisterViewModel())
    }
}
