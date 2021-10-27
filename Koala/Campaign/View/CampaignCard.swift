//
//  CampaignCard.swift
//  Koala
//
//  Created by Jonathan Clive on 26/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct CampaignCard: View {
    let photoURL: String
    let name: String
    let package: String
    let date: Date
    let price: Int
    
    private func dateFormat(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        
        return dateFormatter.string(from: date)
    }
    
    var body: some View {
        HStack (alignment: .center) {
            WebImage(url: URL(string: photoURL))
                .resizable()
                .frame(width: 83, height: 88.68)
                .cornerRadius(10)
            VStack (alignment: .leading) {
                Text("\(name)")
                    .font(Font.custom(ThemeFont.poppinsMedium, size: 18))
                    .foregroundColor(.black)
                Text("\(package)")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                Text("\(dateFormat(date:date))")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                Text("\(price)")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
            }
            .padding(.leading, 5)
            .foregroundColor(Color.gray)
            Spacer()
            Button {
                print("tapped")
            } label: {
                Image(systemName: "chevron.right").resizable().frame(width: 18, height: 29)
                    .foregroundColor(Color.orange2)
                    .padding(.leading, 10)
                    
            }
            .padding(.leading, 10)
        }
        .padding()
        .frame(width: 358, height: 129)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 3, x: 1, y: 2)
    }
}

struct CampaignCard_Previews: PreviewProvider {
    static var previews: some View {
        CampaignCard(photoURL: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg", name: "11 Nov Campaign", package: "1x Instagram Post & Story", date: Date().addingTimeInterval(-86400*31), price: 1500000).previewLayout(.sizeThatFits)
    }
}
