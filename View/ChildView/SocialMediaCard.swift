//
//  SocialMediaCard.swift
//  Koala
//
//  Created by Revarino Putra on 25/10/21.
//

import SwiftUI

struct SocialMediaCard: View {
    
    @State private var username = "claraangg"
    @State private var followers = "24K"
    @State private var averageLikes = "1.4K"
    @State private var averageComments = "80"
    @State private var engagementRate = "4.12%"
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Image("ig")
                    .resizable()
                    .frame(width: 45, height: 45)
                Text("@\(username)")
                    .font(Font.custom(ThemeFont.poppinsMedium, size: 14))
                    .foregroundColor(ThemeColor.darkOrange)
            }
            
            HStack (spacing: 26) {
                AccountInfo(numbers: $followers, firstString: "Followers")
                AccountInfo(numbers: $averageLikes, firstString: "Average", secondString: "Likes")
                AccountInfo(numbers: $averageComments, firstString: "Average", secondString: "Comments")
                AccountInfo(numbers: $engagementRate, firstString: "Engagement", secondString: "Rate")
            }
        }
        .frame(maxWidth: 358, maxHeight: 151)
        .background(Color.init(hex: "FFF1ED"))
        .cornerRadius(10)
        
    }
}

struct SocialMediaCard_Previews: PreviewProvider {
    static var previews: some View {
        SocialMediaCard()
            .previewLayout(.sizeThatFits)
    }
}

struct AccountInfo: View {
    @Binding var numbers: String
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
