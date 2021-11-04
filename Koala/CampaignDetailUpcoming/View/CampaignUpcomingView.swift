//
//  CampaignUpcomingView.swift
//  Koala
//
//  Created by Revarino Putra on 03/11/21.
//

import SwiftUI

struct CampaignUpcomingView: View {
    @ObservedObject var campaignVM = CampaignUpcomingViewModel()
    
    init() {
        campaignVM.getUpcomingDetail(id: 1)
    }
    
    var body: some View {
        ScrollView (.vertical, showsIndicators: false) {
            
        }
    }
}

struct CampaignUpcomingView_Previews: PreviewProvider {
    static var previews: some View {
        CampaignUpcomingView()
    }
}
