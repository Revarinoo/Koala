//
//  CampaignUpcomingResponse.swift
//  Koala
//
//  Created by Revarino Putra on 03/11/21.
//

import Foundation

struct CampaignUpcomingResponse: Codable {
    let campaign: ContentModel
    let campaign_details: [ContentDetailModel]
    let references: [String]
    let message: String
    let code: Int
}

struct ContentModel: Codable {
    let name: String?
    let description: String?
    let schedule: String?
    let product_name: String?
    let rules: String?
    let campaign_logo: String?
}

struct ContentDetailModel: Codable {
    let content_type: String?
    let instruction: String?
}

