//
//  ResultTypeCard.swift
//  Koala
//
//  Created by Jonathan Clive on 29/10/21.
//

import SwiftUI

struct ResultTypeCard: View {
    var type: String
    var body: some View {
        VStack (alignment: .leading) {
            HStack (alignment: .center) {
                Image("ig")
                    .resizable()
                    .frame(width: 45, height: 45)
                Text("\(type)")
                    .font(Font.custom(ThemeFont.poppinsMedium, size: 18))
                    .foregroundColor(Color.init(hex: "541605"))
                AccountInfo(numbers: "12.2K", firstString: "Total", secondString: "Reach")
                    .padding(.leading, 10)
                AccountInfo(numbers: "10.1K", firstString: "Total", secondString: "Impression")
                    .padding(.leading, 10)
                AccountInfo(numbers: "5.2%", firstString: "Total", secondString: "ER")
                    .padding(.leading, 10)
            }
            .padding(.leading, 17)
            
        }
        .frame(width: 357, height: 90, alignment: .leading)
        .background(Color.init(hex: "FFF1ED"))
        .cornerRadius(10)
        .shadow(color: .gray, radius: 3, x: 1, y: 2)
    }
}

struct ResultTypeCard_Previews: PreviewProvider {
    static var previews: some View {
        ResultTypeCard(type: "Post").previewLayout(.sizeThatFits)
    }
}
