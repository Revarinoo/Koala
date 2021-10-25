//
//  SplashScreen.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 22/10/21.
//

import SwiftUI

struct SplashScreen: View {
    
    @State var nextNavigation: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("splashScreen")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    Spacer()
                    Text("Koala")
                        .font(Font.custom(ThemeFont.poppinsSemiBold, size: 36))
                        .foregroundColor(.white)
                    
                    Text("App Slogan")
                        .font(Font.custom(ThemeFont.poppinsSemiBold, size: 27))
                        .foregroundColor(.white)
                        .padding(.bottom, 64)
                    
                    NavigationLink(
                        destination: OnboardingView(),
                        isActive: $nextNavigation,
                        label: {
                            Button {
                                nextNavigation.toggle()
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
                        })
                    
                    Button {
                        print("I'm an Influencer Tapped")
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
                    
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
