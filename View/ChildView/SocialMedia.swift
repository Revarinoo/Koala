//
//  SocialMedia.swift
//  Koala
//
//  Created by Revarino Putra on 25/10/21.
//

import SwiftUI

struct SocialMedia: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 14) {
            Text("Social Media")
                .font(Font.custom(ThemeFont.poppinsMedium, size: 18))
            SocialMediaCard()
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
            
        }
        .frame(maxWidth: 390, maxHeight: 221)
    }
}

struct SocialMedia_Previews: PreviewProvider {
    static var previews: some View {
        SocialMedia()
            .previewLayout(.sizeThatFits)
    }
}
