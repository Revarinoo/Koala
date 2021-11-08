//
//  ResultExpenseView.swift
//  Koala
//
//  Created by Jonathan Clive on 29/10/21.
//

import SwiftUI

struct ResultExpenseCard: View {
    var price: Int
    var body: some View {
        VStack (alignment: .leading) {
            HStack (alignment: .center) {
                Image("expense")
                    .resizable()
                    .frame(width: 45, height: 45)
                Text("Expense")
                    .font(Font.custom(ThemeFont.poppinsMedium, size: 18))
                    .foregroundColor(Color.init(hex: "541605"))
            }
            .padding(.leading, 13)
            Text("IDR \(price)")
                .font(Font.custom(ThemeFont.poppinsSemiBold, size: 24))
                .padding(.leading, 67)
                .padding(.top, -15)
                .foregroundColor(Color.init(hex: "541605"))
        }
        .frame(width: 357, height: 103, alignment: .leading)
        .background(Color.init(hex: "FFF1ED"))
        .cornerRadius(10)
        .shadow(color: .gray, radius: 3, x: 1, y: 2)
    }
}

struct ResultExpenseCard_Previews: PreviewProvider {
    static var previews: some View {
        ResultExpenseCard(price: 1000000).previewLayout(.sizeThatFits)
    }
}
