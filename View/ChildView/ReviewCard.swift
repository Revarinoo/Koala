//
//  ReviewCard.swift
//  Koala
//
//  Created by Jonathan Clive on 25/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ReviewCard: View {
    let business_name: String
    let message: String
    @State var value = false
    init(business_name: String, message: String){
        UIScrollView.appearance().bounces = false
        self.business_name = business_name
        self.message = message
    }
    var body: some View {
        VStack {
            ScrollView(.vertical){
                ExpandableText(message, lineLimit: 4)
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 12))
                    .padding(.horizontal, 4)
            }
            
            Spacer()
            
            HStack{
                Spacer()
                Text("\(business_name)")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 12))
                    .foregroundColor(ThemeColor.grayDark)
            }
        }.frame(width: 210, height: 120)
            .padding(.horizontal, 10)
            .padding(.vertical, 8)
        
        .background(Color.init(hex: "FFFFFF"))
        .cornerRadius(10)
        .shadow(color: Color.init(hex: "C4C4C4"), radius: 3, x: 0, y: 3)
    }
}

struct ReviewCard_Previews: PreviewProvider {
    static var previews: some View {
        ReviewCard(business_name:"Kopi Kenangan", message: "Creative Content and amazing result of brand awareness.Creative Content and amazing result of brand awareness.Creative Content and amazing result of brand awareness.Creative Content and amazing result of brand awareness.Creative Content and amazing result of brand awareness.").previewLayout(.sizeThatFits)
    }
}


