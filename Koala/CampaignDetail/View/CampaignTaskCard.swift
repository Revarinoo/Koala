//
//  CampaignTaskCard.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 02/11/21.
//

import SwiftUI

struct CampaignTaskCard: View {
    
    var productName: String
    var instructions: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack(spacing: 12) {
                    Image("ig")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 45, height: 45)
                    Text("1x \(productName)")
                        .font(Font.custom(ThemeFont.poppinsMedium, size: 14))
                }
                Text("\(instructions)")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 12))
            }
            Spacer()
        }
        .padding()
        .background(Color.init(hex: "FFF1ED"))
        .cornerRadius(10)
        .shadow(color: ThemeColor.gray, radius: 3, x: 1, y: 2)
        
    }
}

struct CampaignTaskCard_Previews: PreviewProvider {
    static var previews: some View {
        CampaignTaskCard(productName: "Instagram Post", instructions: "Introduction: \nHot boba ini merupakan kolaborasi spesial antara Kopi Memory dengan Hotgirl London yang menggunakan boba asli Taiwan. Hot Boba bisa dinikmati dengan varian Milk Tea terbaru dari Kopi Memory ataupun dijadikan ekstra topping di minuman favorit kamu!. Buat yang belum coba, beli sekarang yuk!\nHashtag:\n #KopiMemory #4TahunKopiMemory \nPosts:\nInstagram Post x1\nInstagram Story x1")
    }
}
