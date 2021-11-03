//
//  CampaignOrderCard.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 27/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct CampaignOrderCard: View {
    
    let contentID: Int
    let photoURL: String
    let productTypes: [String]
    let name: String
    let date: Date
    
    private func dateFormat(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        
        return dateFormatter.string(from: date)
    }
    
    var body: some View {
        VStack(spacing: 1) {
            HStack (alignment: .center) {
                WebImage(url: URL(string: photoURL))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 83, height: 88.68)
                    .cornerRadius(10)
                VStack (alignment: .leading, spacing: 6) {
                    HStack(spacing: 6) {
                        ForEach(productTypes, id: \.self) { category in
                            Text(category.components(separatedBy: " ").last!)
                                .font(Font.custom(ThemeFont.poppinsMedium, size: 10))
                                .frame(width: 71, height: 20)
                                .foregroundColor(ThemeColor.primary)
                                .background(ThemeColor.primaryLight)
                                .cornerRadius(5)
                        }
                    }
                    Text("\(name)")
                        .font(Font.custom(ThemeFont.poppinsMedium, size: 18))
                        .foregroundColor(.black)
                    Text("\(dateFormat(date:date))")
                        .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                }
                .padding(.leading, 5)
                .foregroundColor(Color.gray)
                Spacer()
            }
            HStack {
                Spacer()
                NavigationLink(
                    destination: CampaignDetailView(campaignTitle: name, contentID: contentID),
                    label: {
                        Text("Detail")
                            .font(Font.custom(ThemeFont.poppinsMedium, size: 14))
                            .foregroundColor(ThemeColor.primary)
                            .frame(width: 90, height: 38)
                    }
                )
                Button(
                    action: {},
                    label: {
                        Text("Choose")
                            .font(Font.custom(ThemeFont.poppinsMedium, size: 14))
                            .foregroundColor(.white)
                            .frame(width: 113, height: 38)
                            .background(ThemeColor.primary)
                            .cornerRadius(12)
                    })
            }
        }
        .padding()
        .frame(height: 163)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: ThemeColor.gray, radius: 5, x: 1, y: 2)
    }
}

struct CampaignOrderCard_Previews: PreviewProvider {
    static var previews: some View {
        CampaignOrderCard(contentID: 1, photoURL: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg", productTypes: ["Story", "Post"], name: "11 Nov Campaign", date: Date().addingTimeInterval(-86400*31)).previewLayout(.sizeThatFits)
    }
}
