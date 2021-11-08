//
//  SocialMedia.swift
//  Koala
//
//  Created by Revarino Putra on 25/10/21.
//

import SwiftUI

struct SocialMedia: View {
    var influencer: InfluencerDetailModel?
    var body: some View {
        VStack (alignment: .leading, spacing: 14) {
            Text("Social Media")
                .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
            if let influencer = influencer {
                SocialMediaCard(influencer: influencer)
                    .shadow(color: Color.init(hex: "C4C4C4"), radius: 3, x: 0, y: 3)
            }
            
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
