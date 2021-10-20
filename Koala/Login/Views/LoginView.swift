//
//  LoginView.swift
//  Koala
//
//  Created by Revarino Putra on 11/10/21. Edited by Jonathan Clive
//

import SwiftUI
import SDWebImageSwiftUI

struct LoginView: View {
    
    @ObservedObject var loginVM = LoginViewModel()
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.orange2, .orange1, .white]), startPoint: .top, endPoint: .center).ignoresSafeArea(.all)
                VStack {
                    VStack(alignment: .leading) {
                        Text("Welcome back")
                            .font(Font.custom(ThemeFont.poppinsSemiBold, size: 24))
                        Text("You've been missed!")
                            .font(Font.custom(ThemeFont.poppinsSemiBold, size: 12))
                            .foregroundColor(Color("darkGray"))
                            .padding(.bottom)
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
                        Spacer()
                    }
                    
                    Button {
                        print("tapped")
                        loginVM.callLoginInfluencer(email: email, password: password)
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
//                .edgesIgnoringSafeArea(.bottom)
                .frame(maxHeight: .infinity, alignment: .center)
                .padding(31)
                .background(Color.white.ignoresSafeArea(edges: .bottom))
                .cornerRadius(15)
                
                
//                .navigationBarTitle("Sign In")
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        HStack {
                            Text("Sign In")
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

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
