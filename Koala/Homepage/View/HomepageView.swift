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
    @State var toRecommendedInfluencerList: Bool = false
    
    var categories : [String]
    
    init(categories: [String]) {
        self.categories = categories
        categoriesDefault.set(categories, forKey: "myKey")
    }
    
    var body: some View {
        VStack {
            HStack(spacing: 5){
                ProfileButton(photoURL: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg", name: "Kenneth J")
                Spacer()
                Button(action:{
                    token = ""
                    
                }){
                    Image(systemName: "bell")
                        .font(.system(size: 22, weight: .regular)).foregroundColor(.black)
                }
            }
            .padding(.horizontal, 16.0)
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
            ScrollView(.vertical){
                VStack(spacing: 12){
                    ForEach (recomenndationList.recommendationModel){ i in
                        NavigationLink(destination: (token != "") ? AnyView(InfluencerDetailView(influencerID: i.id)) : AnyView(LoginView())) {
                            RecommendationInfluencerCard(photoURL: i.photo, categories: i.category, name: i.name, price: i.price).padding(.leading,16).padding(.trailing, 16)
                        }
                    }
                }
            }
        }
        .onAppear(perform: {
            recomenndationList.callGetInfluencerList(categories: categoriesDefault.object(forKey: "myKey") as? [String] ?? [""])
        })
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .padding(.top, 25)
        .background(ThemeColor.background.ignoresSafeArea())
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView(categories: ["Coffee"])
    }
}
