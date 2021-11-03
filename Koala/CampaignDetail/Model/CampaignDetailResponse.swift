//
//  CampaignDetailResponse.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 02/11/21.
//

import Foundation

struct CampaignDetailResponse: Codable {
    let data: [CampaignDetail]?
    let code: Int
    let message: String
}

struct CampaignDetail: Codable {
    let id: Int?
    let content_id: Int?
    let content_type: String?
    let instruction: String?
}
