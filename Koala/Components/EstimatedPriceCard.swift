//
//  EstimatedPriceView.swift
//  Koala
//
//  Created by Jonathan Clive on 08/11/21.
//

import SwiftUI

struct EstimatedPriceCard: View {
    var products: [ProductModel]
    
    private func pricePrint (price: Int) -> String {
        if price == 0 {
            return "N/A"
        } else if price > 999999{
            return "\(String(format: "%g", Double(price)/1000000))M"
        } else if price > 999 {
            return "\(price/1000)K"
        } else {
            return "\(price)"
        }
    }
    
    var body: some View {
        HStack {
            VStack {
                Image("ig")
                    .resizable()
                    .frame(width: 45, height: 45)
                Text("Instagram")
                    .font(Font.custom(ThemeFont.poppinsMedium, size: 14))
                    .foregroundColor(ThemeColor.darkOrange)
            }.padding(.trailing, 35)
            VStack {
                ForEach(products) { product in
                    HStack {
                        let words = product.content_type.byWords
                        Text("\(String(words.last ?? ""))")
                            .font(Font.custom(ThemeFont.poppinsRegular, size: 12))
                            .foregroundColor(.init(hex: "DC5B38"))
                        Spacer()
                        Text("\(pricePrint(price:product.minPrice)) - \(pricePrint(price:product.maxPrice))")
                            .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                            .foregroundColor(ThemeColor.darkOrange)
                    }
                    .frame(width: 160)
                }
            }
        }
        .frame(maxWidth: 358, minHeight: 126)
        .background(Color.init(hex: "FFF1ED"))
        .cornerRadius(10)
        .shadow(color: Color.init(hex: "C4C4C4"), radius: 3, x: 0, y: 3)
    }
}

struct EstimatedPriceCard_Previews: PreviewProvider {
    static var previews: some View {
        EstimatedPriceCard(products: [ProductModel(content_type: "Story", minPrice: 100000, maxPrice: 300000), ProductModel(content_type: "Post", minPrice: 300000, maxPrice: 500000)]).previewLayout(.sizeThatFits)
    }
}
