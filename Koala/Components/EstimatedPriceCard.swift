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
           
                Image("ig")
                    .resizable()
                    .frame(width: 45, height: 45)
                    .padding(.leading)
                Text("Instagram")
                    .font(Font.custom(ThemeFont.poppinsMedium, size: 14))
                    .foregroundColor(ThemeColor.darkOrange)
           Spacer()
            VStack(spacing: 10) {
                
                ForEach(products) { product in
                  
                        let words = product.content_type.byWords
                        Text("\(String(words.last ?? ""))")
                            .font(Font.custom(ThemeFont.poppinsRegular, size: 12))
                            .foregroundColor(.init(hex: "DC5B38")).padding(.trailing)
                        
                }
            }
            VStack(alignment: .leading,spacing: 2){
                ForEach(products) { product in
                    Text("\(pricePrint(price:product.minPrice)) - \(pricePrint(price:product.maxPrice))")
                        .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                        .foregroundColor(ThemeColor.darkOrange)
                }
            }
            Spacer(minLength: 0)
        }
        .frame(maxWidth: 358, minHeight: 126)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.init(hex: "C4C4C4"), radius: 3, x: 0, y: 3)
    }
}

struct EstimatedPriceCard_Previews: PreviewProvider {
    static var previews: some View {
        EstimatedPriceCard(products: [ProductModel(content_type: "Story", minPrice: 100000, maxPrice: 300000), ProductModel(content_type: "Post", minPrice: 300000, maxPrice: 500000)]).previewLayout(.sizeThatFits)
    }
}
