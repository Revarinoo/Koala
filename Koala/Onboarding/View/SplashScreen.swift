//
//  SplashScreen.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 22/10/21.
//

import SwiftUI

struct SplashScreen: View {
    
    @State var toBusinessPage: Bool = false
    @State var toInfluencerPage: Bool = false
    @AppStorage("role", store: .standard) var role = ""
    
    var body: some View {
        //NavigationView {
            ZStack {
                Image("splashScreen")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    Spacer()
                    Text("Koala")
                        .font(Font.custom(ThemeFont.poppinsSemiBold, size: 36))
                        .foregroundColor(.white)
                        .padding(.bottom, 4)
                    
                    Text("Collaboration.")
                        .font(Font.custom(ThemeFont.poppinsSemiBold, size: 27))
                        .foregroundColor(.white)
                        .padding(.bottom, -20)
                    
                    Text("Engage. Awareness.")
                        .font(Font.custom(ThemeFont.poppinsSemiBold, size: 27))
                        .foregroundColor(.white)
                        .padding(.bottom, 70)
                    
//                    NavigationLink(
//                        destination: OnboardingView(),
//                        isActive: $toBusinessPage,
//                        label: {
                            Button {
                                role = "Business"
                                toBusinessPage.toggle()
                            } label: {
                                Text("Find an Influencer")
                                    .padding(15)
                                    .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                                    .frame(minWidth: 326, maxWidth: .infinity, alignment: .center)
                            }
                            .foregroundColor(.white)
                            .background(ThemeColor.primary)
                            .cornerRadius(15)
                            .padding(.bottom, 8)
//                        })
                    
                    
                    NavigationLink(
                        destination: LoginView(),
                        isActive: $toInfluencerPage,
                        label: {
                            Button {
                                role = "Influencer"
                                toInfluencerPage.toggle()
                            } label: {
                                Text("I'm an Influencer")
                                    .padding(15)
                                    .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                                    .frame(minWidth: 326, maxWidth: .infinity, alignment: .center)
                            }
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.white, lineWidth: 1)
                            )
                            .padding(.bottom, 30)
                       })
                }
                .padding(.horizontal, 16)
            }
            .navigationBarHidden(true)
            .navigate(to: OnboardingView(), when: $toBusinessPage).navigationBarHidden(true)
//            .navigate(to: UnderMaintenanceView(), when: $toInfluencerPage).navigationBarHidden(true)
        //}
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
