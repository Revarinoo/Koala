//
//  PriceRange.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 21/10/21.
//

import SwiftUI

struct PriceRange: View {
    
    @Binding var minPrice: Int
    @Binding var maxPrice: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Price")
                .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                .foregroundColor(.black)
            HStack {
                TextField("Minimum price", value: $minPrice, formatter: NumberFormatter.currency)
                    .textFieldStyle(OvalTextFieldStyle())
                    .keyboardType(.numberPad)
                Image(systemName: "minus")
                    .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                    .foregroundColor(ThemeColor.gray)
                    .padding(EdgeInsets(top: 0, leading: 4, bottom: 6, trailing: 4))
                TextField("Maximum price", value: $maxPrice, formatter: NumberFormatter.currency)
                    .textFieldStyle(OvalTextFieldStyle())
                    .keyboardType(.numberPad)
            }
        }
        .padding(.horizontal)
    }
}
