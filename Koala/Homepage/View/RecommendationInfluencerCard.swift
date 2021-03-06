//
//  RecommendationInfluencerCard.swift
//  Koala
//
//  Created by Sholihatul Richas on 19/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecommendationInfluencerCard: View {
    let photoURL: String?
    let categories: [String]
    let name: String
    let price: Int
    var body: some View {
        HStack (){
            WebImage(url: URL(string: photoURL ?? HttpUtility.defaultImages))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 75, height: 75)
                .cornerRadius(10)
                .padding(.leading, 16)
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 4) {
                    ForEach(categories, id: \.self) { category in
                        Text(category).scaledToFill()
                            .font(Font.custom(ThemeFont.poppinsMedium, size: 10))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 2)
                            .foregroundColor(ThemeColor.primary)
                            .background(ThemeColor.primaryLight)
                            .frame(height: 20)
                            .cornerRadius(5)
                            
                    }
                }
                Text(name)
                    .font(Font.custom(ThemeFont.poppinsMedium, size: 18))
                    .foregroundColor(.black)
                    .scaledToFill()
                    .frame(width: 200, alignment: .leading)
                
                Text("Starts IDR \(price.rupiahFormatter())").scaledToFill()
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(.gray)
                    .frame(width: 200, alignment: .leading)
                Spacer()
            }.padding(.top, 3)
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                Image(systemName: "chevron.right").resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 12)
                    .foregroundColor(ThemeColor.primary)
                    .padding(.trailing, 12)
            }
        }
        .padding(.vertical, 14)
        .background(Color.white)
        .frame(height: 95)
        .cornerRadius(10)
    }
}

struct RecommendationInfluencerCard_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationInfluencerCard(photoURL: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg", categories: ["Coffee", "Street Food", "Drinks"], name: "Alex Ferdinand Sr.", price: 165000)
            .previewLayout(.sizeThatFits)
    }
}
