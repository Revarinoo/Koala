//
//  SocialMediaCard.swift
//  Koala
//
//  Created by Revarino Putra on 25/10/21.
//

import SwiftUI

struct SocialMediaCard: View {
    
    var influencer: InfluencerDetailModel?
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Image("ig")
                    .resizable()
                    .frame(width: 45, height: 45)
                Text("@\(influencer?.platforms[0].socialmedia_id ?? "")")
                    .font(Font.custom(ThemeFont.poppinsMedium, size: 14))
                    .foregroundColor(ThemeColor.darkOrange)
            }.padding(.top, 16)
            
            HStack (spacing: 26) {
                if let influencer = influencer {
                    AccountInfo(numbers: Double(influencer.platforms[0].followers).thousandsFormatter(), firstString: "Followers")
                    AccountInfo(numbers: influencer.platforms[0].average_likes.thousandsFormatter(), firstString: "Average", secondString: "Likes")
                    AccountInfo(numbers: influencer.platforms[0].average_comments.thousandsFormatter(), firstString: "Average", secondString: "Comments")
                    AccountInfo(numbers: "\(influencer.influencer_profile.engagement_rate ?? 0)%", firstString: "Engagement", secondString: "Rate")
                }
                
            }.padding(.bottom, 16)
            
        }
        .frame(maxWidth: 358, maxHeight: 151)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.init(hex: "C4C4C4"), radius: 3, x: 0, y: 3)
        
        
    }
}

struct SocialMediaCard_Previews: PreviewProvider {
    static var previews: some View {
        SocialMediaCard()
            .previewLayout(.sizeThatFits)
    }
}

struct AccountInfo: View {
    var numbers: String = ""
    var firstString: String = "Followers"
    var secondString: String = ""
    
    var body: some View {
        VStack {
            Text(numbers)
                .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                .foregroundColor(ThemeColor.darkOrange)
            Text(firstString)
                .font(Font.custom(ThemeFont.poppinsRegular, size: 12))
                .foregroundColor(Color.init(hex: "DC5B38"))
            Text(secondString)
                .font(Font.custom(ThemeFont.poppinsRegular, size: 12))
                .foregroundColor(Color.init(hex: "DC5B38"))
        }
    }
}
