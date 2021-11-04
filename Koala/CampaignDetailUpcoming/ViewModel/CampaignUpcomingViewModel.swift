//
//  CampaignUpcomingViewModel.swift
//  Koala
//
//  Created by Revarino Putra on 03/11/21.
//

import Foundation

class CampaignUpcomingViewModel: ObservableObject {
    
    @Published var campaignModel = CampaignUpcomingModel(campaign_logo: "", campaign_title: "", due_date: "", product: "", description: "", rules: "", references: [""])
    private var campaignUpcomingService = CampaignUpcomingService()
    
    func getUpcomingDetail(id: Int) {
        campaignUpcomingService.getUpcomingDetail(id: id) { result in
            print("masuk")
            print(result)
//            if let campaign = result?.campaign {
//                DispatchQueue.main.async {
//                    print("INI NAME")
//                    print(campaign.name!)
////                    print(detail.count)
//                }
//            }
        }
    }
    
}
