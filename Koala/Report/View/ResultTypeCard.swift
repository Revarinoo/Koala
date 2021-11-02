//
//  ResultTypeCard.swift
//  Koala
//
//  Created by Jonathan Clive on 29/10/21.
//

import SwiftUI

struct ResultTypeCard: View {
    var type: String
    var reachNum: String
    var impressionNum: String
    var body: some View {
        VStack (alignment: .center) {
            Circle()
                .fill(Color.white)
                .frame(width: 82, height: 82)
                .overlay(
                    VStack {
                        Image("ig")
                            .resizable()
                            .frame(width: 45, height: 45)
                            .padding(.bottom, -20)
                        Text("\(type)")
                            .font(Font.custom(ThemeFont.poppinsMedium, size: 18))
                            .foregroundColor(Color.init(hex: "541605"))
                    }
                ,alignment: .center)
                .overlay(Circle().stroke(Color.init(hex: "FE724C"), lineWidth: 2))
            
            TypeInfo(numbers: "\(reachNum)", desc: "Reach")
            TypeInfo(numbers: "\(impressionNum)", desc: "Impression")
        }
        .frame(width: 106, height: 182, alignment: .center)
        .background(Color.init(hex: "FFF1ED"))
        .cornerRadius(10)
        .shadow(color: .gray, radius: 3, x: 1, y: 2)
    }
}

struct ResultTypeCard_Previews: PreviewProvider {
    static var previews: some View {
        ResultTypeCard(type: "Post", reachNum: "10.1K", impressionNum: "2.1K").previewLayout(.sizeThatFits)
    }
}

struct TypeInfo: View {
    var numbers: String = ""
    var desc: String = "Followers"
    
    var body: some View {
        VStack {
            Text(numbers)
                .font(Font.custom(ThemeFont.poppinsSemiBold, size: 16))
                .foregroundColor(ThemeColor.darkOrange)
                .padding(.bottom, -15)
            Text(desc)
                .font(Font.custom(ThemeFont.poppinsRegular, size: 12))
                .foregroundColor(Color.init(hex: "DC5B38"))
        }
    }
}
