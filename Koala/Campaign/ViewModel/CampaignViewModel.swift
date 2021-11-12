//
//  CampaignViewModel.swift
//  Koala
//
//  Created by Jonathan Clive on 27/10/21.
//

import Foundation
import SwiftUI

class CampaignViewModel: ObservableObject{
    
    static let shared = CampaignViewModel()
    @Published var campaignModel: [CampaignModel] = []
    @Published var orderCampaignModel: OrderCampaignModel = OrderCampaignModel()
    private let campaignService: CampaignService = CampaignService()
    
    private func dateFormatter(dateBefore: String) -> Date {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        
        return dateFormatterGet.date(from: dateBefore) ?? Date()
    }
    
    func refresh() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.callGetCampaigns()
        }
    }
    
    func callGetCampaigns() {
        var campaigns: [CampaignModel] = []
        campaignService.getCampaign() { response in
            if let code = response?.code {
                if code == 201, let responseData = response?.data {
                    for campaign in responseData {
                        let content_id = campaign.content_id
                        let name = campaign.name
                        let schedule = campaign.schedule
                        let status = campaign.status
                        let photo = campaign.photo
                        var campaignTypes: [String] = []
                        
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
    
    func order(date: String, contentID: Int, influencerID: Int) {
        
        let orderRequest = CampaignOrderRequest(order_date: date, content_id: contentID, influencer_id: influencerID)
        print(orderRequest)
        campaignService.postOrder(orderRequest) { response in
            DispatchQueue.main.async {
                if let code = response?.code, let message = response?.message {
                    if code == 201 {
                        self.orderCampaignModel.navigate = true
                    }
                    else {
                        self.orderCampaignModel.isPresentingErrorAlert = true
                    }
                }
            }
        }
    }
    
}
