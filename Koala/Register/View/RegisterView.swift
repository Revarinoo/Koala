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
    @StateObject var registerVM = RegisterViewModel()
    @State private var agree: Bool = false
    @AppStorage("role", store: .standard) var role = "Influencer"
    
    var body: some View {
        
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.orange2, .orange1, .white]), startPoint: .top, endPoint: .center).ignoresSafeArea(.all)
                ScrollView {
                    VStack {
                        RegisterBusinessView(registerVM: registerVM)
                        if role == "Influencer" {
                            RegisterInfluencerView(constant: $registerVM.username)
                        }
                        
                        HStack (alignment: .top){
                            CheckBoxView(checked: $agree)
                            VStack (alignment: .leading) {
                                Text("By creating an account, you agree to our")
                                    .font(Font.custom(ThemeFont.poppinsRegular, size: 13))
                                    .foregroundColor(Color("darkGray"))
                                Button {
                                } label: {
                                    Text("Terms and Condition")
                                        .font(Font.custom(ThemeFont.poppinsRegular, size: 13))
                                        .foregroundColor(.black)
                                }
                            }
                            Spacer()
                        }
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 25, trailing: 0))
                        
                        Spacer()
                        
                        NavigationLink(destination: Text("Home"), isActive: $registerVM.isAuthenticate) {
                            Button {
                                registerVM.register()
                            } label: {
                                Text("Sign Up")
                                .padding(15)
                                .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                                .frame(minWidth: 326, maxWidth: .infinity, alignment: .center)
                            }
                            .foregroundColor(.white)
                            .background(Color("primary"))
                            .cornerRadius(15)
                            .padding(.bottom, 8)
                            .alert(isPresented: $registerVM.isPresentingErrorAlert, content: {
                                Alert(title: Text("Alert"), message: Text(registerVM.errorMessage), dismissButton: .cancel(Text("Ok")))
                            })
                            
                        }
                        .disabled(!agree)
                        .opacity(agree ? 1 : 0.5)
                        HStack(alignment: .center){
                            Text("Not registered yet?")
                                .font(Font.custom(ThemeFont.poppinsRegular, size: 12))
                            Button {
                            } label: {
                                Text("Sign In")
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
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
