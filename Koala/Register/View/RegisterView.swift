//
//  RegisterView.swift
//  Koala
//
//  Created by Jonathan Clive on 22/10/21.
//

import SwiftUI

struct RegisterView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var passwordConfirm: String = ""
    @State private var agree: Bool = false
    
    var body: some View {
        
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.orange2, .orange1, .white]), startPoint: .top, endPoint: .center).ignoresSafeArea(.all)
                VStack {
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
                        TextField("Enter your email", text: $name)
                            .textFieldStyle(OvalTextFieldStyle())
                        Text("Email")
                            .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                            .foregroundColor(Color("darkGray"))
                        TextField("Enter your email", text: $email)
                            .textFieldStyle(OvalTextFieldStyle())
                        Text("Password")
                            .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                            .foregroundColor(Color("darkGray"))
                        SecureField("Enter your password", text: $password)
                            .textFieldStyle(OvalTextFieldStyle())
                        Text("Confirm Password")
                            .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                            .foregroundColor(Color("darkGray"))
                        SecureField("Enter your password confirmation", text: $passwordConfirm)
                            .textFieldStyle(OvalTextFieldStyle())
                    }
                    
                    HStack (alignment: .top){
                        CheckBoxView(checked: $agree)
                        VStack (alignment: .leading) {
                            Text("By creating an account, you agree to our")
                                .font(Font.custom(ThemeFont.poppinsRegular, size: 13))
                                .foregroundColor(Color("darkGray"))
                            Button {
                                print("tapped")
                            } label: {
                                Text("Terms and Condition")
                                    .font(Font.custom(ThemeFont.poppinsRegular, size: 13))
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        print("tapped")
                    } label: {
                        Text("Sign In")
                        .padding(15)
                        .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                        .frame(minWidth: 326, maxWidth: .infinity, alignment: .center)
                    }
                    .foregroundColor(.white)
                    .background(Color("primary"))
                    .cornerRadius(15)
                    .padding(.bottom, 8)
                    HStack(alignment: .center){
                        Text("Not registered yet?")
                            .font(Font.custom(ThemeFont.poppinsRegular, size: 12))
                        Button {
                            print("tappppeddd")
                        } label: {
                            Text("Create Account")
                                .foregroundColor(.black)
                                .font(Font.custom(ThemeFont.poppinsBold, size: 12))
                        }
                    }
                }
                .frame(maxHeight: .infinity, alignment: .center)
                .padding(31)
                .background(Color.white.ignoresSafeArea(edges: .bottom))
                .cornerRadius(15)
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        HStack {
                            Text("Create Account")
                                .font(Font.custom(ThemeFont.poppinsSemiBold, size: 27))
                                .foregroundColor(.white)
                                .padding(.top, 75)
                                .padding(.leading, 5)
                        }
                    }
                }
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
