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
            HStack (alignment: .center) {
                ResultTypeCard(type: "Story", reachNum: "10.1K", impressionNum: "2.1K")
                ResultTypeCard(type: "Post", reachNum: "10.1K", impressionNum: "2.1K")
                ResultTypeCard(type: "Reels", reachNum: "10.1K", impressionNum: "2.1K")
            }
        }
    }
}

struct CampaignDetailReportView_Previews: PreviewProvider {
    static var previews: some View {
        CampaignDetailReportView()
    }
}
