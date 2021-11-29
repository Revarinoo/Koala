//
//  CampaignReportBusinessModel.swift
//  Koala
//
//  Created by Jonathan Clive on 03/11/21.
//

import Foundation

struct CampaignDetailReportBusinessModel: Identifiable {
    let id: UUID = UUID()
    let content_name: String
    let start_date: Date
    let dueDate: Date
    let campaign_logo: String
    let totalExpense: Int
    let analytics: [AnalyticReportModel]?
    let influencers: [InfluencerReportModel]?
}

struct AnalyticReportModel: Identifiable {
    let id: UUID = UUID()
    let content_type: String
    let total_reach: Int
    let total_imp: Int
}

struct InfluencerReportModel: Identifiable {
    let id: UUID = UUID()
    let influencer_id: Int
    let name: String
    let photo: String
    let total_price: Int
    let total_likes: Int
    let total_comments: Int
    let engagement_rate: Double
}
