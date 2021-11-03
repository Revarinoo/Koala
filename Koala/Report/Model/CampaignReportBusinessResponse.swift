//
//  CampaignReportBusinessResponse.swift
//  Koala
//
//  Created by Jonathan Clive on 03/11/21.
//

import Foundation

struct CampaignReportBusinessResponse: Codable {
    let campaign_detail: CampaignDetailReportBusiness?
    let code: Int
    let message: String
}

struct CampaignDetailReportBusiness: Codable {
    let content_name: String
    let dueDate: String
    let campaign_logo: String
    let totalExpense: Int
    let analytics: [AnalyticReport]?
    let influencers: [InfluencerReport]?
}

struct AnalyticReport: Codable {
    let content_type: String
    let total_reach: String
    let total_imp: String
}

struct InfluencerReport: Codable {
    let influencer_id: Int
    let name: String
    let photo: String
    let total_price: Int
    let total_likes: String
    let total_comments: String
    let engagement_rate: String
}
