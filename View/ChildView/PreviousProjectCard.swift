//
//  PreviousProjectCard.swift
//  Koala
//
//  Created by Jonathan Clive on 25/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct PreviousProjectCard: View {
    let photoURL: String
    let reach: Int
    let impression: Int
    
    var body: some View {
        VStack (alignment: .center) {
            WebImage(url: URL(string: photoURL))
                .resizable()
                .clipShape(Circle())
                .frame(width: 82, height: 82)
                .overlay(Circle().stroke(Color.init(hex: "FE724C"), lineWidth: 2))
            Text("\(reach)K")
                .font(Font.custom(ThemeFont.poppinsSemiBold, size: 16))
                .foregroundColor(Color.init(hex: "541605"))
            Text("Reach")
                .font(Font.custom(ThemeFont.poppinsRegular, size: 12))
                .foregroundColor(Color.init(hex: "DC5B38"))
            Text("\(impression)K")
                .font(Font.custom(ThemeFont.poppinsSemiBold, size: 16))
                .foregroundColor(Color.init(hex: "541605"))
            Text("Impression")
                .font(Font.custom(ThemeFont.poppinsRegular, size: 12))
                .foregroundColor(Color.init(hex: "DC5B38"))
        }
        .frame(width: 106, height: 182)
        .background(Color.init(hex: "FFF1ED"))
        .cornerRadius(10)
        .shadow(color: .gray, radius: 3, x: 1, y: 2)
    }
}

struct PreviousProjectCard_Previews: PreviewProvider {
    static var previews: some View {
        PreviousProjectCard(photoURL: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg", reach: 10, impression: 100).previewLayout(.sizeThatFits)
    }
}
