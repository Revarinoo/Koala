//
//  BusinessReportCard.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 09/11/21.
//

import SwiftUI

struct BusinessReportCard: View {
    
    // TODO: Formatting value & percentage
    let iconName: String
    let value: Int
    let percentage: Double
    
    var body: some View {
        HStack {
            Image(iconName)
                .frame(width: 40, height: 43)
                .padding(.trailing, 6)
            
            VStack(alignment: .leading) {
                Text("Average")
                Text("Reach")
            }
            .font(Font.custom(ThemeFont.poppinsSemiBold, size: 14))
            Spacer()
            VStack(alignment: .trailing) {
                Text("\(value)")
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
        BusinessReportCard(iconName: "avgER", value: 3000, percentage: -32.2)
            .previewLayout(.sizeThatFits)
    }
}
