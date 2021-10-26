//
//  CompletedCard.swift
//  Koala
//
//  Created by Sholihatul Richas on 26/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct CompletedCard: View {
    let name: String
    let productType : String
    let reach: String
    let impression: String
    let engagement: String
    
    var body: some View {
        VStack{
            HStack(spacing: 18){
                WebImage(url: URL(string: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg"))
                    .resizable()
                    .frame(width: 82, height: 88)
                    .cornerRadius(10)
                VStack (alignment: .leading, spacing: 6){
                    Text(name).font(Font.custom(ThemeFont.poppinsMedium, size: 18))
                    HStack(spacing: 15){
                        VStack{
                            Text(reach).font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                            Text("Reach").font(Font.custom(ThemeFont.poppinsRegular, size: 12)).foregroundColor(ThemeColor.primary)
                        }
                        VStack{
                            Text(impression).font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                            Text("Impression").font(Font.custom(ThemeFont.poppinsRegular, size: 12)).foregroundColor(ThemeColor.primary)
                        }
                        VStack{
                            Text(engagement).font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                            Text("Engagement").font(Font.custom(ThemeFont.poppinsRegular, size: 12)).foregroundColor(ThemeColor.primary)
                        }
                    }
                }
                Spacer()
            }.padding(.top, 16)
            HStack{
                Spacer()
                Button(action: {}){
                    Text("Review").font(Font.custom(ThemeFont.poppinsMedium, size: 12))
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

struct CompletedCard_Previews: PreviewProvider {
    static var previews: some View {
        CompletedCard(name: "Felix Lee", productType: "", reach: "21.5K", impression: "10.8K", engagement: "10.1%").previewLayout(.sizeThatFits)
    }
}
