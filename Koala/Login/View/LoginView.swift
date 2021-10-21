//
//  LoginView.swift
//  Koala
//
//  Created by Revarino Putra on 11/10/21.
//  Edited by Jonathan Clive & Syahrul Fadholi

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var loginVM = LoginViewModel()
    
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
                        TextField("Enter your email", text: $loginVM.loginModel.email)
                            .textFieldStyle(OvalTextFieldStyle())
                        Text("Password")
                            .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                            .foregroundColor(Color("darkGray"))
                        SecureField("Enter your password", text: $loginVM.loginModel.password)
                            .textFieldStyle(OvalTextFieldStyle())
                        Spacer()
                    }
                    
                    NavigationLink(
                        destination: Text("Login Success").navigationBarBackButtonHidden(true),
                        isActive: $loginVM.loginModel.navigate,
                        label: {
                            Button {
                                print("tapped")
                                if(loginVM.validateUserInputs()) {
                                    loginVM.login()
                                }
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
                            .alert(isPresented: $loginVM.loginModel.isPresentingErrorAlert, content: {
                                Alert(title: Text("Alert"), message: Text(loginVM.loginModel.errorMessage), dismissButton: .cancel(Text("Ok")))
                            })
                        })
                    
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
