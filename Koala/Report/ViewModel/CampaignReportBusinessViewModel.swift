//
//  CampaignReportBusinessViewModel.swift
//  Koala
//
//  Created by Jonathan Clive on 03/11/21.
//

import Foundation
import SwiftUI

class CampaignReportBusinessViewModel: ObservableObject{
    
    @Published var campaignReportBusinessModel: CampaignDetailReportBusinessModel?
    private let campaignReportBusinessService: CampaignReportBusinessService = CampaignReportBusinessService()
    
    private func dateFormatter(dateBefore: String) -> Date {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        
        return dateFormatterGet.date(from: dateBefore) ?? Date()
    }
    
    func callGetCampaignReports(campaign_id: Int) {
        var campaignModel: CampaignDetailReportBusinessModel?
        var analytics: [AnalyticReportModel] = []
        var influencers: [InfluencerReportModel] = []
        campaignReportBusinessService.getCampaignReportBusiness(campaign_id, completionHandler: { response in
            if let code = response?.code {
                if code == 201, let campaign = response?.campaign_detail {
                    let unwrappedAnalytics = campaign.analytics ?? []
                    let unwrappedInfluencers = campaign.influencers ?? []
                    
                    for analytic in unwrappedAnalytics {
                        analytics.append(AnalyticReportModel(content_type: analytic.content_type, total_reach: Int(analytic.total_reach) ?? 0, total_imp: Int(analytic.total_imp) ?? 0))
                    }
                    
                    for influencer in unwrappedInfluencers {
                        influencers.append(InfluencerReportModel(influencer_id: influencer.influencer_id, name: influencer.name, photo: influencer.photo, total_price: influencer.total_price, total_likes: Int(influencer.total_likes) ?? 0, total_comments: Int(influencer.total_comments) ?? 0, engagement_rate: Double(influencer.engagement_rate) ?? 0))
                    }
                    campaignModel = CampaignDetailReportBusinessModel(content_name: campaign.content_name, dueDate: self.dateFormatter(dateBefore: campaign.end_date), campaign_logo: campaign.campaign_logo ?? HttpUtility.defaultImages, totalExpense: campaign.totalExpense ?? 0, analytics: analytics, influencers: influencers)
                    
                    DispatchQueue.main.async {
                        self.campaignReportBusinessModel = campaignModel!
                    }
                }
            }
        }
    )}
}
