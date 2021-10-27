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
    let productType : [String]
    
    var body: some View {
        VStack{
            HStack(spacing: 18){
                WebImage(url: URL(string: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg"))
                    .resizable()
                    .frame(width: 82, height: 88)
                    .cornerRadius(10)
                    .padding(.leading, 12)
                VStack (alignment: .leading, spacing: 6){
                    HStack (spacing: 9){
                        ForEach (productType, id: \.self){ product in Text(product)
                            
                        }
                    }
                    Text(name)
                    HStack{
                        Image(systemName: "calendar")
                        Text("28 November 2021")
                    }
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
        .padding([.leading,.trailing], 16)
    }
}

struct OngoingCard_Previews: PreviewProvider {
    static var previews: some View {
        OngoingCard(name: "Bella Anastasia", productType: ["post", "story"]).previewLayout(.sizeThatFits)
    }
}
