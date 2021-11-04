//
//  CampaignUpcomingViewModel.swift
//  Koala
//
//  Created by Revarino Putra on 03/11/21.
//

import Foundation

class CampaignUpcomingViewModel: ObservableObject {
    
    @Published var campaignModel = CampaignUpcomingModel(campaign_logo: "", campaign_title: "", due_date: "", product: "", description: "", rules: "", references: [""])
    @Published var campaignDetailModel: [CampaignDetailUpcomingModel] = []
    private var campaignUpcomingService = CampaignUpcomingService()
    
    func getUpcomingDetail(id: Int) {
        campaignUpcomingService.getUpcomingDetail(id: id) { result in
            if let campaign_logo = result?.campaign.campaign_logo, let campaign_title = result?.campaign.name, let due_date = result?.campaign.schedule, let product = result?.campaign.product_name, let description = result?.campaign.description, let rules = result?.campaign.rules, let references = result?.references, let details = result?.campaign_details {
                
                var campaignDetails: [CampaignDetailUpcomingModel] = []
                
                DispatchQueue.main.async {
                    self.campaignModel.campaign_logo = campaign_logo
                    self.campaignModel.campaign_title = campaign_title
                    self.campaignModel.due_date = due_date
                    self.campaignModel.product = product
                    self.campaignModel.description = description
                    self.campaignModel.rules = rules
                    self.campaignModel.references = references
                }
                
                for detail in details {
                    let content_type = detail.content_type ?? ""
                    let instruction = detail.instruction ?? ""
                    let singleDetail = CampaignDetailUpcomingModel(content_type: content_type, content_detail: instruction)
                    campaignDetails.append(singleDetail)
                }
                DispatchQueue.main.async {
                    self.campaignDetailModel = campaignDetails
                }
            }
        }
    }
    
}
