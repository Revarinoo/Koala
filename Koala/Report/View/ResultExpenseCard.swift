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
                    .shadow(color: Color.init(hex: "BFBFBF").opacity(0.5), radius: 1, x: -1, y: 2)
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
        .frame(minWidth: 357, minHeight: 103, alignment: .leading)
    }
}

struct ResultExpenseCard_Previews: PreviewProvider {
    static var previews: some View {
        ResultExpenseCard(price: 1000000).previewLayout(.sizeThatFits)
    }
}
