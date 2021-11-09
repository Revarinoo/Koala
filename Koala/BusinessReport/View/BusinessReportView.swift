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
                    Spacer()
                }
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 8, trailing: 0))
                
                Text("This Month")
                    .font(Font.custom(ThemeFont.poppinsSemiBold, size: 14))
                    .padding(EdgeInsets(top: 10, leading: 16, bottom: 0, trailing: 0))
                
                HStack {
                    Text("10.500.000")
                        .font(Font.custom(ThemeFont.poppinsSemiBold, size: 24))
                        .foregroundColor(ThemeColor.primary)
                        .padding(.leading)
                    
                    Text("IDR")
                        .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                        .foregroundColor(Color(hex: "FFB19D"))
                }
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct BusinessReportView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessReportView()
    }
}
