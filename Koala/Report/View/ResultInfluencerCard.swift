//
//  ResultInfuencerCard.swift
//  Koala
//
//  Created by Jonathan Clive on 02/11/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ResultInfluencerCard: View {
    var photoURL: String
    var name: String
    var price: Int
    var likeNum: String
    var commentNum: String
    var erNum: String
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                WebImage(url: URL(string: "\(photoURL)"))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 67, height: 72)
                    .cornerRadius(20.0)
                VStack (alignment: .leading) {
                    Text("\(name)")
                        .font(Font.custom(ThemeFont.poppinsMedium, size: 18))
                        .foregroundColor(Color.black)
                    Text("IDR \(price)")
                        .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                        .foregroundColor(Color.init(hex: "A7A7A7"))
                }
            }
            .padding(.init(top: 20, leading: 0, bottom: 0, trailing: 0))
            HStack {
                AccountInfo(numbers: "\(likeNum)", firstString: "Total", secondString: "Likes")
                    .padding(.trailing)
                AccountInfo(numbers: "\(commentNum)", firstString: "Total", secondString: "Comments")
                    .padding(.trailing)
                AccountInfo(numbers: "\(erNum)", firstString: "Engagement", secondString: "Rate")
            }
            .padding(.init(top: 0, leading: 90, bottom: 20, trailing: 0))
        }
        .frame(width: 357, height: 169)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.init(hex: "BFBFBF").opacity(0.5), radius: 3, x: 1, y: 2)
    }
}

struct ResultInfluencerCard_Previews: PreviewProvider {
    static var previews: some View {
        ResultInfluencerCard(photoURL: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg", name: "Asoka Remadjas", price: 1000000, likeNum: "11.6K", commentNum: "5.2K", erNum: "3.1%").previewLayout(.sizeThatFits)
    }
}
