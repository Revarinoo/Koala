//
//  PriceRange.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 21/10/21.
//

import SwiftUI

struct PriceRange: View {
    var body: some View {
        VStack {
            Text("Location")
                .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                .foregroundColor(.black)
            HStack {
                
            }
        }
        .padding(.horizontal, 18)
    }
}

struct PriceRange_Previews: PreviewProvider {
    static var previews: some View {
        PriceRange().previewLayout(.sizeThatFits)
    }
}
