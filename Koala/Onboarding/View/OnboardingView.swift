//
//  OnboardingView.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 22/10/21.
//

import SwiftUI

struct OnboardingView: View {
    
    @ObservedObject var onboardVM = OnboardViewModel()
    let columns = [
        GridItem(.flexible(minimum: 115, maximum: 130)),
        GridItem(.flexible(minimum: 115, maximum: 130)),
        GridItem(.flexible(minimum: 115, maximum: 130))
    ]
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.bgColorView.edgesIgnoringSafeArea(.all)
            Image("onboardAsset")
                .offset(x: (UIScreen.main.bounds.width / 2) - 18, y: (UIScreen.main.bounds.height / -2) + 138)
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: -8) {
                    Text("What is")
                    Text("your business")
                    Text("interest?")
                }
                .font(Font.custom(ThemeFont.poppinsSemiBold, size: 36))
                .foregroundColor(ThemeColor.primary)
                
                Text("max. 3 interests")
                    .font(Font.custom(ThemeFont.poppinsSemiBold, size: 14))
                    .foregroundColor(ThemeColor.primaryMedium)
                
                LazyVGrid(columns: columns) {
                    ForEach(onboardVM.specialties.indices) { index in
                        Button(action: {
                            if onboardVM.countSpecialtyClicked() < 3 || onboardVM.specialties[index].isClicked == true {
                                onboardVM.specialties[index].isClicked.toggle()
                            }
                        }, label: {
                            Text(onboardVM.specialties[index].name)
                                .font(Font.custom(ThemeFont.poppinsMedium, size: 14))
                                .padding(.vertical, 4)
                                .frame(minWidth: 115)
                                .foregroundColor(onboardVM.specialties[index].isClicked ? ThemeColor.primary : ThemeColor.grayDark)
                                .background(onboardVM.specialties[index].isClicked ? ThemeColor.primaryLight : .white)
                                .cornerRadius(5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(onboardVM.specialties[index].isClicked ? ThemeColor.primary : ThemeColor.grayDark, lineWidth: 1)
                                )
                        })
                    }
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
            .padding(.horizontal)
            
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
