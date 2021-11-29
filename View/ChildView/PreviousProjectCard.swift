//
//  PreviousProjectCard.swift
//  Koala
//
//  Created by Jonathan Clive on 25/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct PreviousProjectCard: View {
    let post_photo: String
    let business_photo: String
    let business_name: String
    let total_comments: String
    let total_likes: String
    let engagement_rate: String
    
    var body: some View {
        HStack{
            if(post_photo != ""){
                WebImage(url: URL(string: post_photo))
                    .resizable()
                    .imageScale(.large)
                    .frame(width: 140, height: 140)
                    .padding(.trailing, 16)
            }else{
                Text("No Post Image").frame(width: 140, height: 140)
            }
            
            VStack(alignment: .leading){
                HStack{
                    WebImage(url: URL(string: business_photo))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .cornerRadius(5)
                    Text(business_name)
                        .font(Font.custom(ThemeFont.poppinsRegular, size: 12))
                }
                HStack(spacing: 20){
                    VStack(alignment: .leading, spacing: 10){
                        Text(Double(total_comments)?.thousandsFormatter() ?? "")
                            .font(Font.custom(ThemeFont.poppinsSemiBold, size: 16))
                            .padding(.trailing,8)
                        Text(Double(total_likes)?.thousandsFormatter() ?? "") .font(Font.custom(ThemeFont.poppinsSemiBold, size: 16))
                            .padding(.trailing,8)
                        Text(engagement_rate + "%")
                            .font(Font.custom(ThemeFont.poppinsSemiBold, size: 16))
                            .padding(.trailing,8)
                    }
                    VStack(alignment: .leading, spacing: 16){
                        Text("Comments")
                            .font(Font.custom(ThemeFont.poppinsRegular, size: 12))
                        Text("Likes")
                            .font(Font.custom(ThemeFont.poppinsRegular, size: 12))
                        Text("Engagement Rate")
                            .font(Font.custom(ThemeFont.poppinsRegular, size: 12))
                    }
                }
            }
            Spacer(minLength: 0)
        }.frame(width: 358, height: 140)
    }
}

struct PreviousProjectCard_Previews: PreviewProvider {
    static var previews: some View {
        PreviousProjectCard(post_photo: "https://media.matamata.com/thumbs/2021/05/26/91972-rose-blackpink-instagramatroses-are-rosie/745x489-img-91972-rose-blackpink-instagramatroses-are-rosie.jpg", business_photo: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg", business_name: "Kopi Memory", total_comments: "42.4K", total_likes: "89.3K", engagement_rate: "17.3").previewLayout(.sizeThatFits)
    }
}
