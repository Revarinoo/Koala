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
        var campaignPhotos: [String] = []
        campaignService.getCampaign() { response in
            if let responseData = response?.data {
                for campaign in responseData {
                    let name = campaign.name
                    let schedule = campaign.schedule
                    let status = campaign.status
                    
                    for picture in campaign.photo! {
                        campaignPhotos.append(picture)
                    }
                    
                    let campaign = CampaignModel(name: name!, photo: campaignPhotos, schedule: self.dateFormatter(dateBefore: schedule!), status: status!)
                    
                    campaigns.append(campaign)
                }
            }
            
            DispatchQueue.main.async {
                self.campaignModel = campaigns
            }
        }
    }
    
}
