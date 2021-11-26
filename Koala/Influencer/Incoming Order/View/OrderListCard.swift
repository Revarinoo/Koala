//
//  OrderListCard.swift
//  Koala
//
//  Created by Revarino Putra on 23/11/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct OrderListCard: View {
    
    var orderList: OrderListModel
    var status: String
    
    var body: some View {
        NavigationLink(
            destination: status != OrderListStatus.completed.rawValue ? AnyView(InfluencerCampaignDetailView(id: orderList.orderId, status: status)) : AnyView(OrderReviewView(orderId: orderList.orderId)),
            label: {
                HStack {
                    WebImage(url: URL(string: orderList.campaignLogo))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 83, height: 88)
                        .cornerRadius(10)
                        .padding(.leading, 15)
                    
                    VStack (alignment: .leading, spacing: 3) {
                        Text(orderList.campaignName)
                            .font(.custom(ThemeFont.poppinsMedium, size: 18))
                            .foregroundColor(.black)
                        Text("\(orderList.startDate) - \(orderList.endDate)")
                            .font(.custom(ThemeFont.poppinsRegular, size: 14))
                            .foregroundColor(ThemeColor.grayDark)
                    }
                    .frame(maxWidth: 205, alignment: .leading)
                    .padding(.leading, 5)
                    
                    Image(systemName: "chevron.right")
                        .resizable()
                        .foregroundColor(ThemeColor.primary)
                        .frame(width: 14, height: 25)
                        .padding(.trailing, 15)
                }
                .frame(width: 358, height: 129)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: ThemeColor.grayDark.opacity(0.4), radius: 3, x: 0, y: 5)
            }
        )
        
        
    }
}

struct OrderListCard_Previews: PreviewProvider {
    static var previews: some View {
        OrderListCard(orderList: OrderListModel(orderId: 1, campaingId: 1, campaignStatus: "Pending", campaignName: "12 Des Campaign", startDate: "22 Nov 2021", endDate: "02 Des 2021", campaignLogo: "https://koala-influencer.xyz/storage/images/default.png"), status: "Ongoing")
            .previewLayout(.sizeThatFits)
    }
    
}
