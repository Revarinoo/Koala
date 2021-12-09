//
//  OnboardingView.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 22/10/21.
//

import SwiftUI

struct OnboardingView: View {
    
    @ObservedObject var onboardVM = OnboardViewModel()
    @State var nextNavigation: Bool = false
    @StateObject var tabBarVM = TabBarViewModelNotLoggedIn()
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
                Spacer()
                
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
                    .padding(.bottom, 36)
                
                LazyVGrid(columns: columns) {
                    ForEach(onboardVM.interest.indices) { index in
                        Button(action: {
                            if onboardVM.countSpecialtyClicked() < 3 || onboardVM.interest[index].isClicked == true {
                                onboardVM.interest[index].isClicked.toggle()
                            }
                        }, label: {
                            Text(onboardVM.interest[index].name)
                                .font(Font.custom(ThemeFont.poppinsMedium, size: 14))
                                .padding(.vertical, 4)
                                .frame(minWidth: 110, minHeight: 40)
                                .foregroundColor(onboardVM.interest[index].isClicked ? ThemeColor.primary : ThemeColor.grayDark)
                                .background(onboardVM.interest[index].isClicked ? ThemeColor.primaryLight : .white)
                                .cornerRadius(10)
                                .padding(.bottom, 10)
                                .shadow(color: ThemeColor.gray, radius: 3, x: 0, y: 2)
                        })
                    }
                }
                .padding(.bottom, 64)
                Button {
                    categoriesDefault.set(onboardVM.getSpecialtyClicked(), forKey: "myKey")
                    nextNavigation.toggle()
                } label: {
                    Text("Next")
                        .padding(15)
                        .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                        .frame(minWidth: 326, maxWidth: .infinity, alignment: .center)
                }
                .foregroundColor(.white)
                .background(ThemeColor.primary)
                .cornerRadius(15)
                .padding(.bottom, 20)
//                NavigationLink(
//                    destination: //TabBar(selectedTab: $tabBarVM.selectedTab)
//                        HomepageView()
//                        .navigationBarHidden(true),
//                    isActive: $nextNavigation,
//                    label: {
//                        Button {
//                            categoriesDefault.set(onboardVM.getSpecialtyClicked(), forKey: "myKey")
//                            nextNavigation.toggle()
//                        } label: {
//                            Text("Next")
//                                .padding(15)
//                                .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
//                                .frame(minWidth: 326, maxWidth: .infinity, alignment: .center)
//                        }
//                        .foregroundColor(.white)
//                        .background(ThemeColor.primary)
//                        .cornerRadius(15)
//                        .padding(.bottom, 20)
//                    })
                
                
            }
            .padding(.horizontal)
            .navigationBarTitle("")
            .navigationBarHidden(true)
            //.navigate(to: TabBarNotLoggedIn(selectedTab: $tabBarVM.selectedTab), when: $nextNavigation)
            .fullScreenCover(isPresented: $nextNavigation){
                TabBar(selectedTab: $tabBarVM.selectedTab)
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
