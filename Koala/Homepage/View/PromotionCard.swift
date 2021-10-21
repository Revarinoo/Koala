//
//  PromotionCard.swift
//  Koala
//
//  Created by Sholihatul Richas on 21/10/21.
//

import SwiftUI

struct PromotionCard: View {
    var body: some View {
        HStack{
            VStack(spacing: 6){
                Text("Welcoming Offer").font(Font.custom(ThemeFont.poppinsRegular, size: 12))
                    .multilineTextAlignment(.leading)
                Text("10% off your first order with influencer").font(Font.custom(ThemeFont.poppinsSemiBold, size: 14))
                Button(action:{}){
                    Text("Book Influencer").font(Font.custom(ThemeFont.poppinsMedium, size: 12))
                        .foregroundColor(.white)
                }.frame(width: 159, height: 30, alignment: .center)
                    .background(ThemeColor.primary)
                    .cornerRadius(10)
            }.padding(.leading, 16)
            Image("offer").padding()
        }
            .padding(.horizontal, 10)
            .padding(.vertical, 2)
            .background(ThemeColor.primaryLight)
            .cornerRadius(10)
            .shadow(color: .gray, radius: 3, x: 1, y: 2)
    }
}

struct PromotionCard_Previews: PreviewProvider {
    static var previews: some View {
        PromotionCard()
    }
}
