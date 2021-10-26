//
//  OngoingCard.swift
//  Koala
//
//  Created by Sholihatul Richas on 26/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct OngoingCard: View {
    
    let name: String
    let productType : String
    
    var body: some View {
        VStack{
            HStack(spacing: 18){
                WebImage(url: URL(string: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg"))
                    .resizable()
                    .frame(width: 82, height: 88)
                    .cornerRadius(10)
                VStack (alignment: .leading, spacing: 6){
                    HStack (spacing: 9){
                         Text(productType).scaledToFill()
                                .font(Font.custom(ThemeFont.poppinsMedium, size: 12))
                                .padding(.horizontal, 10)
                                .padding(.vertical, 2)
                                .foregroundColor(ThemeColor.primary)
                                .frame(minWidth: 71, minHeight: 20, alignment: .center)
                                .background(ThemeColor.primaryLight)
                                .cornerRadius(5)
                    }
                    Text(name).font(Font.custom(ThemeFont.poppinsMedium, size: 18))
                    HStack{
                        Image(systemName: "calendar")
                        Text("28 November 2021")
                    }.font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                        .foregroundColor(Color.gray)
                }
                Spacer()
            }.padding(.top, 16)
            HStack{
                Spacer()
                Button(action: {}){
                    Text("Reschedule").font(Font.custom(ThemeFont.poppinsMedium, size: 12))
                        .foregroundColor(.white)
                        .padding()
                        .padding([.leading, .trailing])
                }.frame(height: 38)
                    .background(ThemeColor.primary)
                    .cornerRadius(10)
            }.padding(.bottom, 9)
            
            
        }
        .cornerRadius(10)
        .padding([.leading,.trailing], 16)
    }
}

struct OngoingCard_Previews: PreviewProvider {
    static var previews: some View {
        OngoingCard(name: "Bella Anastasia", productType: "Post").previewLayout(.sizeThatFits)
    }
}
