//
//  PaymentOrderDetail.swift
//  Koala
//
//  Created by Revarino Putra on 25/11/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct PaymentOrderDetail: View {
    @StateObject var paymentVM: PaymentViewModel
    
    var body: some View {
        VStack (alignment: .leading, spacing: 18) {
            
            PaymentText(title: "Campaign", content: paymentVM.orderDetail.campaign_name)
            
            PaymentText(title: "Time Period", content: paymentVM.orderDetail.time_period)
            
            ForEach(paymentVM.orderDetail.detail, id: \.id) { detail in
                PaymentText(title: "\(detail.content_type) Price", content: "Rp \(Int(detail.price).rupiahFormatter())")
            }
            
            VStack (alignment: .leading) {
                Text("Influencer")
                    .font(.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(ThemeColor.grayDark)
                HStack (spacing: 12) {
                    WebImage(url: URL(string: paymentVM.orderDetail.influencer.photo))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .cornerRadius(10)
                    
                    Text(paymentVM.orderDetail.influencer.name)
                        .font(.custom(ThemeFont.poppinsMedium, size: 16))
                        .foregroundColor(.black)
                }
            }
            
        }
        .padding(.leading, 18)
        .padding(.top, 23)
        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
        
    }
    
}

struct PaymentOrderDetail_Previews: PreviewProvider {
    static var previews: some View {
        PaymentOrderDetail(paymentVM: PaymentViewModel())
            .previewLayout(.sizeThatFits)
    }
}

struct PaymentText: View {
    var title: String
    var content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.custom(ThemeFont.poppinsRegular, size: 14))
                .foregroundColor(ThemeColor.grayDark)
            Text(content)
                .font(.custom(ThemeFont.poppinsRegular, size: 16))
                .foregroundColor(.black)
        }
    }
}
