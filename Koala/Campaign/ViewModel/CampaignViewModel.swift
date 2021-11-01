//
//  CampaignViewModel.swift
//  Koala
//
//  Created by Jonathan Clive on 27/10/21.
//

import Foundation
import SwiftUI

class CampaignViewModel: ObservableObject{
    
    @Published var campaignModel: [CampaignModel] = []
    private let campaignService: CampaignService = CampaignService()
    
    private func dateFormatter(dateBefore: String) -> Date {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        
        return dateFormatterGet.date(from: dateBefore) ?? Date()
    }
    
    func callGetCampaigns() {
        var campaigns: [CampaignModel] = []
        var campaignTypes: [String] = []
        campaignService.getCampaign() { response in
            if let responseData = response?.data {
                for campaign in responseData {
                    let content_id = campaign.content_id
                    let name = campaign.name
                    let schedule = campaign.schedule
                    let status = campaign.status
                    let photo = campaign.photo
                    
                    for type in campaign.type! {
                        campaignTypes.append(type)
                    }
                    
                    let campaign = CampaignModel(content_id: content_id!, name: name!, photo: photo!, schedule: self.dateFormatter(dateBefore: schedule!), status: status!, type: campaignTypes)
                    
                    campaigns.append(campaign)
                    print(campaign)
                }
            }
            
            DispatchQueue.main.async {
                self.campaignModel = campaigns
            }
        }
    }
    
}
