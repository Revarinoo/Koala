//
//  PendingCard.swift
//  Koala
//
//  Created by Sholihatul Richas on 28/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct PendingCard: View {
    let name: String
    let productType : [String]
    let dueDate : String
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
                    HStack (spacing: 9){
                        ForEach (productType, id: \.self){
                            product in Text(product).scaledToFill()
                                .font(Font.custom(ThemeFont.poppinsMedium, size: 12))
                                .padding(.horizontal, 10)
                                .padding(.vertical, 2)
                                .foregroundColor(ThemeColor.primary)
                                .frame(minWidth: 71, minHeight: 20, alignment: .center)
                                .background(ThemeColor.primaryLight)
                                .cornerRadius(5)
                        }

                    }
                    Text(name).font(Font.custom(ThemeFont.poppinsMedium, size: 18))
                    HStack{
                        Image(systemName: "calendar")
                        
                        Text(dueDate)
                    }.font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                        .foregroundColor(Color.gray)
                }
                Spacer()
            }.padding([.top, .leading, .trailing], 16)
            HStack{
                Spacer()
                Button(action: {}){
                    Text("Cancel").font(Font.custom(ThemeFont.poppinsMedium, size: 12))
                        .foregroundColor(ThemeColor.primary)
                        .padding()
                        .padding([.leading, .trailing])
                }.frame(width: 113, height: 38)
                    .cornerRadius(12)
                    .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(ThemeColor.primary, lineWidth: 1)
                        )
            }.padding(.bottom, 9).padding(.trailing, 15)
            
            
        }
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct PendingCard_Previews: PreviewProvider {
    static var previews: some View {
        PendingCard(name: "James Oliver", productType: ["Post"], dueDate: "22 December 2021", photo: "").previewLayout(.sizeThatFits)
    }
}
