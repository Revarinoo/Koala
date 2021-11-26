//
//  EstimatedPrice.swift
//  Koala
//
//  Created by Jonathan Clive on 08/11/21.
//

import SwiftUI

struct EstimatedPrice: View {
    var products: [ProductModel]
    var body: some View {
        VStack (alignment: .leading) {
            Text("Estimated Price")
                .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
            EstimatedPriceCard(products: products).padding(.vertical, 8)
        }
    }
}

struct EstimatedPrice_Previews: PreviewProvider {
    static var previews: some View {
        EstimatedPrice(products: []).previewLayout(.sizeThatFits)
    }
}
