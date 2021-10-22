//
//  HomepageView.swift
//  Koala
//
//  Created by Sholihatul Richas on 19/10/21.
//

import SwiftUI

struct HomepageView: View {
    @ObservedObject var recomenndationList = RecommendationViewModel()
    
    //
    @State var categories : [String] = ["Coffee"]
    
    var body: some View {
        VStack{
            HStack(spacing: 5){
                ProfileButton(photoURL: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg", name: "Kenneth J")
                Spacer()
                Button(action:{}){
                    Image(systemName: "magnifyingglass").imageScale(.medium)
                }
                Button(action:{}){
                    Image(systemName: "bell").imageScale(.medium)
                }
            }
            .padding(.horizontal, 16.0)
            HStack{
                Text("Browse Category").font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                    .foregroundColor(.black)
                Spacer()
                Button(action:{}){
                    Text("See more ").font(Font.custom(ThemeFont.poppinsMedium, size: 12))
                        .foregroundColor(.black)
                }
                
            }.padding(.leading,16).padding(.trailing, 16)
            HomepageCategoriesCard()
            PromotionCard().padding(.leading,16).padding(.trailing, 16)
            HStack{
                Text("Recommendation").font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                    .foregroundColor(.black)
                Spacer()
                Button(action:{}){
                    Text("See more ").font(Font.custom(ThemeFont.poppinsMedium, size: 12))
                        .foregroundColor(.black)
                }
                
            }.padding(.leading,16).padding([.top, .trailing], 16.0)
            ScrollView(.vertical){
                VStack(spacing: 12){
                    ForEach (recomenndationList.recommendationModel){ i in
                        RecommendationInfluencerCard(photoURL: i.photo, categories: i.category, name: i.name, price: i.price).padding(.leading,16).padding(.trailing, 16)
                    }
                }
            }
        }
        .padding(.top, 25)
        .background(ThemeColor.background.ignoresSafeArea())
        .onAppear() {
            recomenndationList.callGetInfluencerList(categories: categories)
        }
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
    }
}