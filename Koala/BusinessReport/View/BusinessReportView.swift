//
//  BusinessReportView.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 09/11/21.
//

import SwiftUI

struct BusinessReportView: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.bgColorView.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Text("Business Report")
                        .font(Font.custom(ThemeFont.poppinsSemiBold, size: 17))
                        .padding(.trailing)
                    Spacer()
                }
                .padding(.bottom, 8)
                
                Text("This Month")
                    .font(Font.custom(ThemeFont.poppinsSemiBold, size: 14))
                    .padding(.top, 10)
                
                HStack {
                    Text("10.500.000")
                        .font(Font.custom(ThemeFont.poppinsSemiBold, size: 24))
                        .foregroundColor(ThemeColor.primary)
                    
                    Text("IDR")
                        .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                        .foregroundColor(Color(hex: "FFB19D"))
                }
                Spacer()
                Text("Chart data")
                Spacer()
                Text("Overview")
                    .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                BusinessReportCard(iconName: "avgReach", reportType: "Reach", value: 1349, percentage: 32.2)
                BusinessReportCard(iconName: "avgImpression", reportType: "Impression", value: 1516, percentage: 20.13)
                BusinessReportCard(iconName: "avgER", reportType: "Engagement Rate", value: 32.23, percentage: -5.23)
                    .padding(.bottom)
            }
            .padding(.horizontal)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct BusinessReportView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessReportView()
    }
}
