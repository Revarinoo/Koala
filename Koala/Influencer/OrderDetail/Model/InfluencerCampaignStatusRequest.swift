//
//  InfluencerCampaignStatusRequest.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 25/11/21.
//

import Foundation

struct InfluencerCampaignStatusRequest: Encodable {
    let order_id: Int
    let status: String
}

struct InfluencerCampaignStatusResponse: Decodable {
    let code: Int
    let message: String
}
