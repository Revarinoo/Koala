//
//  CampaignUpcomingModel.swift
//  Koala
//
//  Created by Revarino Putra on 03/11/21.
//

import Foundation

struct CampaignUpcomingModel: Identifiable {
    let id = UUID()
    let campaign_logo: String
    let campaign_title: String
    let due_date: String
    let product: String
    let description: String
    let rules: String
    let references: [String]
}

struct CampaignDetailUpcomingModel: Identifiable {
    let id = UUID()
    let content_type: String
    let content_detail: String
}
