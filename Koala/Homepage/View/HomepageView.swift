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
                    ProfileButton(photoURL: userProfile.user.photo, name: userProfile.user.name != "" && token != "" ? userProfile.user.name : "Guest")
                    Spacer()
                    Button(action:{
                        token = ""
                        
                    }){
                        Image(systemName: "bell")
                            .font(.system(size: 22, weight: .regular)).foregroundColor(.black)
                    }
                }
                .padding(.horizontal, 16.0)
                ScrollView(.vertical){
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
                                    NavigationLink(destination: (token != "") ? AnyView(InfluencerDetailView(influencerID: i.id)) : AnyView(LoginView())) {
                                        RecommendationInfluencerCard(photoURL: i.photo, categories: i.category, name: i.name, price: i.price).padding(.leading,16).padding(.trailing, 16)
                                    }
                                }
                            }
                        }
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
        }
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
    }
}





