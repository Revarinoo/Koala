//
//  InfluencerCardList.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 18/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct InfluencerCardList: View {
    
    let photoURL: String
    let categories: [String]
    let name: String
    let location: String
    let price: Int
    let ER: Double
    let rating: Double
    
    var body: some View {
        HStack {
            WebImage(url: URL(string: photoURL))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(10)
                .padding(.all, 10)
                .padding(.leading, 12)
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 4) {
                    ForEach(categories.prefix(3), id: \.self) { category in
                        Text(category)
                            .font(Font.custom(ThemeFont.poppinsMedium, size: 10))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 2)
                            .foregroundColor(ThemeColor.primary)
                            .background(ThemeColor.primaryLight)
                            .cornerRadius(5)
                    }
                }
                
                Text(name)
                    .font(Font.custom(ThemeFont.poppinsMedium, size: 18))
                    .foregroundColor(.black)
                
                
                
                Text("Starts IDR \(price.rupiahFormatter())")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 12))
                    .foregroundColor(.gray)
                
                
                HStack(spacing: 2) {
                    Image("starIcon2")
                        .resizable()
                        .frame(width: 12, height: 12)
                        .padding(.bottom, 1)
                        .foregroundColor(ThemeColor.secondary)
                    Text("\(rating.oneDecimalFormatter)")
                        .font(Font.custom(ThemeFont.poppinsRegular, size: 12))
                        .foregroundColor(.gray)
                }
            }
            Spacer()
            Image(systemName: "chevron.right")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 12)
                .foregroundColor(ThemeColor.primary)
                .padding(.trailing, 12)
        }
        .padding(.vertical, 14)
        .background(Color.white)
        .frame(height: 124)
        .cornerRadius(10)
    }
}

struct InfluencerCardList_Previews: PreviewProvider {
    static var previews: some View {
        InfluencerCardList(photoURL: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg", categories: ["Coffee", "Street Food", "Bakery", "Korean Food"], name: "Alex Ferdinand Sr.", location: "Jakarta Barat", price: 165000, ER: 3.5, rating: 4.3)
            .previewLayout(.sizeThatFits)
    }
}
