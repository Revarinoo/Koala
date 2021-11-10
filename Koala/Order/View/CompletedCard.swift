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
    let reach: String
    let impression: String
    let engagement: String
    let photo: String
    
    var body: some View {
        VStack{
            HStack(spacing: 18){
                WebImage(url: URL(string: photo))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 82, height: 88)
                    .cornerRadius(10)
                VStack (alignment: .leading, spacing: 6){
                    Text(name).font(Font.custom(ThemeFont.poppinsMedium, size: 18))
                    HStack{
                        VStack{
                            Text(reach).font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                            Text("Reach").font(Font.custom(ThemeFont.poppinsRegular, size: 12)).foregroundColor(ThemeColor.primary)
                        }
                        Spacer()
                        VStack{
                            Text(impression).font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                            Text("Impression").font(Font.custom(ThemeFont.poppinsRegular, size: 12)).foregroundColor(ThemeColor.primary)
                        }
                        Spacer()
                        VStack{
                            Text(engagement).font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                            Text("Engagement").font(Font.custom(ThemeFont.poppinsRegular, size: 12)).foregroundColor(ThemeColor.primary)
                        }
                        Spacer()
                    }
                }
                Spacer()
            }.padding(.top, 16).padding(.leading, 16)
            HStack{
                Spacer()
                NavigationLink(destination: ReviewInfluencerView(name: name)) {
                        Text("Review").font(Font.custom(ThemeFont.poppinsMedium, size: 12))
                            .foregroundColor(.white)
                            .padding()
                            .padding([.leading, .trailing])
                   .frame(height: 38)
                        .background(ThemeColor.primary)
                        .cornerRadius(10)
                }
            }.padding(.bottom, 9).padding(.trailing, 16)
            
            
        }
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct CompletedCard_Previews: PreviewProvider {
    static var previews: some View {
        CompletedCard(name: "Felix Lee", reach: "21.5K", impression: "10.8K", engagement: "10.1%", photo: "").previewLayout(.sizeThatFits)
    }
}
