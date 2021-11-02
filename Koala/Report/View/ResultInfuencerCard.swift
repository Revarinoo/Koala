//
//  ResultInfuencerCard.swift
//  Koala
//
//  Created by Jonathan Clive on 02/11/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ResultInfuencerCard: View {
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                WebImage(url: URL(string: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg"))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 67, height: 72)
                    .cornerRadius(20.0)
                VStack (alignment: .leading) {
                    Text("Name")
                        .font(Font.custom(ThemeFont.poppinsMedium, size: 18))
                        .foregroundColor(Color.black)
                    Text("Price")
                        .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                        .foregroundColor(Color.init(hex: "A7A7A7"))
                }
            }
            .padding(.init(top: 20, leading: 0, bottom: 0, trailing: 0))
            HStack {
                AccountInfo(numbers: "11.6K", firstString: "Total", secondString: "Likes")
                    .padding(.trailing)
                AccountInfo(numbers: "5.2K", firstString: "Total", secondString: "Comments")
                    .padding(.trailing)
                AccountInfo(numbers: "3.1%", firstString: "Engagement", secondString: "Rate")
            }
            .padding(.init(top: 0, leading: 90, bottom: 20, trailing: 0))
        }
        .frame(width: 357, height: 169)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 3, x: 1, y: 2)
    }
}

struct ResultInfuencerCard_Previews: PreviewProvider {
    static var previews: some View {
        ResultInfuencerCard().previewLayout(.sizeThatFits)
    }
}
