//
//  RegisterView.swift
//  Koala
//
//  Created by Jonathan Clive on 22/10/21.
//  Edited by Syahrul Fadholi

import SwiftUI

struct RegisterView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var registerVM = RegisterViewModel()
    @State private var agree: Bool = false
    @AppStorage("role", store: .standard) var role = "Business"
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            LinearGradient(gradient: Gradient(colors: [.orange2, .orange1, .white]), startPoint: .top, endPoint: .center).ignoresSafeArea(.all)
            
            VStack(alignment: .leading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .font(Font.custom(ThemeFont.poppinsMedium, size: 20))
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 8, trailing: 0))
                })

                Text("Create Account")
                    .font(Font.custom(ThemeFont.poppinsSemiBold, size: 27))
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 0, leading: 28, bottom: 0, trailing: 0))
            }
//
            VStack {
                VStack(alignment: .leading) {
                    RegisterBusinessView(registerVM: registerVM)
                    if role == "Influencer" {
                        RegisterInfluencerView(constant: $registerVM.username)
                    }
                }
                
                HStack (alignment: .top){
                    CheckBoxView(checked: $agree)
                    VStack (alignment: .leading) {
                        Text("By creating an account, you agree to our")
                            .font(Font.custom(ThemeFont.poppinsRegular, size: 13))
                            .foregroundColor(.black)
                        Button {
                        } label: {
                            Text("Terms and Condition")
                                .font(Font.custom(ThemeFont.poppinsSemiBold, size: 13))
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
                        print(registerVM.role)
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
                
                HStack(alignment: .center, spacing: 4){
                    Text("Already have an account?")
                        .font(Font.custom(ThemeFont.poppinsRegular, size: 12))
                    Button(
                        action: {
                            self.presentationMode.wrappedValue.dismiss()
                        },
                        label: {
                            Text("Sign In")
                                .foregroundColor(.black)
                                .font(Font.custom(ThemeFont.poppinsBold, size: 12))
                        })
                }
            }
            .navigationTitle("Create Account")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarHidden(false)
            .frame(maxHeight: .infinity, alignment: .center)
            .padding(31)
            .background(Color.white.ignoresSafeArea(edges: .bottom))
            .cornerRadius(15)
            //.padding(.top, 88)
            .onTapGesture{
                self.dismissKeyboard()
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}


