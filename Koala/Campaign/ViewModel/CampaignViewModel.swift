//
//  CampaignViewModel.swift
//  Koala
//
//  Created by Jonathan Clive on 27/10/21.
//

import Foundation
import SwiftUI

class CampaignViewModel: ObservableObject{
    
    @Published var campaignModel: [Campaign] = []
    private let campaignService: CampaignService = CampaignService()
    @AppStorage("JWT", store: .standard) var token = ""
    
    func callGetCampaigns() {
        var campaigns: [Campaign] = []
        campaignService.getCampaign(token) { response in
            if let responseData = response?.data {
                for campaign in responseData {
                    let name = campaign.name
                    let photo = campaign.photo
                    let schedule = campaign.schedule
                    let status = campaign.status
                    
                    let campaignModel = Campaign(name: name, photo: photo, schedule: schedule, status: status)
                    
                    campaigns.append(campaignModel)
                }
            }
            
            DispatchQueue.main.async {
                self.campaignModel = campaigns
            }
        }
    }
    
}
