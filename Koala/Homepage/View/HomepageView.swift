//
//  HomepageView.swift
//  Koala
//
//  Created by Sholihatul Richas on 19/10/21.
//  Edited by Syahrul Fadholi

import SwiftUI
struct HomepageView: View {
    @AppStorage("JWT", store: .standard) var token = ""
    @StateObject var recomenndationList = RecommendationViewModel()
    @StateObject var userProfile = UserProfileViewModel()
    @State var toRecommendedInfluencerList: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(spacing: 5){
<<<<<<< HEAD
                    ProfileButton(photoURL: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg", name: "Kenneth J")
                    Spacer()
                    Button(action:{}){
=======
                    ProfileButton(photoURL: .constant(userProfile.user.photo), name: token != "" ? .constant(userProfile.user.name) : .constant("Sign in"))
                    Spacer()
                    Button(action:{
                        token = ""
                        userProfile.callData()
                    }){
>>>>>>> b28d938d90a1a6ed141eebde3c5a212283cf6859
                        Image(systemName: "bell")
                            .font(.system(size: 22, weight: .regular)).foregroundColor(.black)
                    }
                }
                .padding(.horizontal, 16.0)
<<<<<<< HEAD
                HStack{
                    Text("Browse Category").font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                        .foregroundColor(.black)
                    Spacer()
                }.padding(.leading,16).padding(.trailing, 16).padding(.top, 20)
                HomepageCategoriesCard()
                PromotionCard().padding(.leading,16).padding(.trailing, 16)
                HStack{
                    Text("Recommendation").font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                        .foregroundColor(.black)
                    Spacer()
                    NavigationLink(
                        destination: RecommendedInfluencerList(categories: categories),
                        isActive: $toRecommendedInfluencerList,
                        label: {
                            Button {
                                toRecommendedInfluencerList.toggle()
                            } label: {
                                Text("See more ").font(Font.custom(ThemeFont.poppinsMedium, size: 12))
                                    .foregroundColor(.black)
                            }
                        })
                    
                }.padding(.leading,16).padding([.trailing], 16.0).padding(.top, 28)
                ScrollView(.vertical){
                    VStack(spacing: 12){
                        ForEach (recomenndationList.recommendationModel){ i in
                            RecommendationInfluencerCard(photoURL: i.photo, categories: i.category, name: i.name, price: i.price).padding(.leading,16).padding(.trailing, 16)
                        }
                    }
=======
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        HStack{
                            Text("Browse Category").font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                                .foregroundColor(.black)
                            Spacer()
                        }.padding(.leading,16).padding(.trailing, 16).padding(.top, 20)
                        HomepageCategoriesCard()
                        PromotionCard().padding(.leading,16).padding(.trailing, 16)
                        HStack{
                            Text("Recommendation").font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                                .foregroundColor(.black)
                            Spacer()
                            
                            
                        }.padding(.leading,16).padding([.trailing], 16.0).padding(.top, 28)
                            VStack(spacing: 12){
                                ForEach (recomenndationList.recommendationModel){ i in
                                    NavigationLink(destination: (token != "") ? AnyView(InfluencerDetailView(influencerID: i.id, fromBackButton: false)) : AnyView(LoginView())) {
                                        RecommendationInfluencerCard(photoURL: i.photo, categories: i.category, name: i.name, price: i.price).padding(.leading,16).padding(.trailing, 16)
                                    }
                                }
                            }
                        }
>>>>>>> b28d938d90a1a6ed141eebde3c5a212283cf6859
                }
                
            }
            .onAppear(perform: {
                recomenndationList.callGetInfluencerList(categories: categoriesDefault.object(forKey: "myKey") as? [String] ?? [""])
            })
            .padding(.top, 25)
            .background(ThemeColor.background.ignoresSafeArea())
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onTapGesture {
                self.dismissKeyboard()
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .padding(.top, 25)
            .background(ThemeColor.background.ignoresSafeArea())
        }
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
    }
}





