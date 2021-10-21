//
//  PriceRange.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 21/10/21.
//

import SwiftUI

struct PriceRange: View {
    
    @State var minPrice: String = ""
    @State var maxPrice: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Price")
                .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                .foregroundColor(.black)
            HStack {
                TextField("Minimum price", text: $minPrice)
                    .textFieldStyle(OvalTextFieldStyle())
                    .keyboardType(.numberPad)
                Image(systemName: "minus")
                    .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                    .foregroundColor(ThemeColor.gray)
                    .padding(EdgeInsets(top: 0, leading: 4, bottom: 6, trailing: 4))
                TextField("Maximum price", text: $maxPrice)
                    .textFieldStyle(OvalTextFieldStyle())
                    .keyboardType(.numberPad)
            }
        }
        .padding(.horizontal)
    }
}

struct PriceRange_Previews: PreviewProvider {

    static var previews: some View {
        PriceRange().previewLayout(.sizeThatFits)
    }
}
