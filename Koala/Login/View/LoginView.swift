//
//  LoginView.swift
//  Koala
//
//  Created by Revarino Putra on 11/10/21.
//  Edited by Jonathan Clive & Syahrul Fadholi

import SwiftUI

struct LoginFromTabBar : View{
    var body: some View{
        NavigationView{
            LoginView()
        }
    }
}

struct LoginView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var loginVM = LoginViewModel()
    @State var toRegisterView: Bool = false
    @StateObject var userProfile = UserProfileViewModel()
    @State var nextNavigation = false
    @StateObject var tabBarVM = TabBarViewModel.shared
    @StateObject var tabBarInfluencerVM = TabBarViewModelInfluencer.shared
    @AppStorage("role", store: .standard) var role = ""
    @State var isNavigate = false
    
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

                    Text("Sign In")
                        .font(Font.custom(ThemeFont.poppinsSemiBold, size: 27))
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 0, leading: 28, bottom: 0, trailing: 0))
                }
                
                VStack {
                    VStack(alignment: .leading) {
                        Text("Welcome back")
                            .font(Font.custom(ThemeFont.poppinsSemiBold, size: 24))
                        Text("You've been missed!")
                            .font(Font.custom(ThemeFont.poppinsSemiBold, size: 12))
                            .foregroundColor(ThemeColor.grayDark)
                            .padding(.bottom)
                        Text("Email")
                            .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                            .foregroundColor(ThemeColor.grayDark)
                        TextField("Enter your email", text: $loginVM.loginModel.email)
                            .textFieldStyle(OvalTextFieldStyle())
                        Text("Password")
                            .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                            .foregroundColor(ThemeColor.grayDark)
                        SecureInputView("Enter your password", text: $loginVM.loginModel.password)
                        Spacer()
                    }
                            Button {
                                if(loginVM.validateUserInputs()) {
                                    loginVM.login()
                                    userProfile.callData()
                                    // nanti hapus kalo gaperlu
                                    if role == "Business" {
                                        self.nextNavigation = true
                                    }
                                    else {
                                        self.isNavigate = true
                                    }
                                    
                                }
                            } label: {
                                Text("Sign In")
                                .padding(15)
                                .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                                .frame(minWidth: 326, maxWidth: .infinity, alignment: .center)
                            }
                            .foregroundColor(.white)
                            .background(ThemeColor.primary)
                            .cornerRadius(15)
                            .padding(.bottom, 8)
                            .alert(isPresented: $loginVM.loginModel.isPresentingErrorAlert, content: {
                                Alert(title: Text("Alert"), message: Text(loginVM.loginModel.errorMessage), dismissButton: .cancel(Text("Ok")))
                            })
                    
                    HStack(alignment: .center, spacing: 4){
                        Text("Not registered yet?")
                            .font(Font.custom(ThemeFont.poppinsRegular, size: 12))
                        NavigationLink(
                            destination: RegisterView(),
                            isActive: $toRegisterView,
                            label: {
                                Button {
                                    toRegisterView.toggle()
                                } label: {
                                    Text("Create Account")
                                        .foregroundColor(.black)
                                        .font(Font.custom(ThemeFont.poppinsBold, size: 12))
                                }
                            }
                        )
                    }
                }
                .navigationTitle("Sign In")
                .navigationBarTitleDisplayMode(.large)
                .navigationBarHidden(false)
                .navigationBarColor(backgroundColor: UIColor(ThemeColor.primary), titleColor: .white, tintColor: .white)
                .frame(maxHeight: .infinity, alignment: .center)
                .padding(31)
                .background(Color.white.ignoresSafeArea(edges: .bottom))
                .cornerRadius(15)
//                .fullScreenCover(isPresented: .constant(nextNavigation && !isNavigate) ){
//                    if role == "Business" {
//                        TabBar(selectedTab: $tabBarVM.selectedTab)
//                    }
//                    else {
//                        TabBarInfluencer(selectedTab: $tabBarInfluencerVM.selectedTab)
//                        self.isNavigate = true
//                    }
//                }
                .navigate(to: TabBar(selectedTab: $tabBarVM.selectedTab), when: $nextNavigation)
                .navigate(to: TabBarInfluencer(selectedTab: $tabBarInfluencerVM.selectedTab), when: $isNavigate)
            }
        
        .onTapGesture{
            self.dismissKeyboard()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
