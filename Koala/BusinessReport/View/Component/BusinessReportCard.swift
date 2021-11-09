//
//  BusinessReportCard.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 09/11/21.
//

import SwiftUI

struct BusinessReportCard: View {
    
    let iconName: String
    let reportType: String
    let value: Double
    let percentage: Double
    
    var body: some View {
        HStack {
            Image(iconName)
                .frame(width: 40, height: 43)
                .padding(.trailing, 6)
            
            VStack(alignment: .leading) {
                Text("Average")
                Text(reportType)
            }
            .font(Font.custom(ThemeFont.poppinsSemiBold, size: 14))
            Spacer()
            VStack(alignment: .trailing) {
                Text(reportType == "Engagement Rate" ? "\(value.oneDecimalFormatter)%" : Int(value).thousandsFormatter())
                    .font(Font.custom(ThemeFont.poppinsMedium, size: 20))
                HStack(spacing: 4) {
                    Image(systemName: percentage > 0 ? "arrow.up" : "arrow.down")
                        .font(Font.custom(ThemeFont.poppinsRegular, size: 12))
                    Text("\(percentage.oneDecimalFormatter)%")
                        .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                }
                .foregroundColor(Color(hex: percentage > 0 ? "27A346" : "D45942"))
            }
        }
        .padding()
        .frame(maxHeight: 76)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 3, x: 1, y: 2)
    }
}

struct BusinessReportCard_Previews: PreviewProvider {
    static var previews: some View {
        BusinessReportCard(iconName: "avgER", reportType: "Engagement Rate", value: 2.31, percentage: -32.2)
            .previewLayout(.sizeThatFits)
    }
}
