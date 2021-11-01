//
//  CampaignDetailReportView.swift
//  Koala
//
//  Created by Jonathan Clive on 29/10/21.
//

import SwiftUI

struct CampaignDetailReportView: View {
    var body: some View {
        VStack (alignment: .leading) {
            Text("Result")
                .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                .foregroundColor(.black)
            ResultExpenseCard(price: 1500000)
            ResultTypeCard(type: "Post")
            ResultTypeCard(type: "Story")
            ResultTypeCard(type: "Reels")
        }
    }
}

struct CampaignDetailReportView_Previews: PreviewProvider {
    static var previews: some View {
        CampaignDetailReportView()
    }
}
