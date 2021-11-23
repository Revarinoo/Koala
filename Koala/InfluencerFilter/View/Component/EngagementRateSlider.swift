//
//  EngagementRateSlider.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 21/10/21.
//

import SwiftUI

struct EngagementRateSlider: View {
    
    @Binding var engagementRate: Double
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Engagement Rate")
                    .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                    .foregroundColor(.black)
                Text("(minimal)")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(ThemeColor.gray)
                Spacer()
                Text("\(engagementRate.oneDecimalFormatter)%")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(.black)
            }
            Slider(value: $engagementRate, in: 0...20)
                .accentColor(ThemeColor.primary)
            HStack {
                Text("0%")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(ThemeColor.gray)
                Spacer()
                Text("20%")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(ThemeColor.gray)
            }
            .padding(.top, -4)
        }
        .padding(.horizontal)
    }
}
