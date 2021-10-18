//
//  InfluencerListModel.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 17/10/21.
//

import Foundation

struct InfluencerListResponse: Codable {
    let data: [InfluencerData]
}

struct InfluencerData: Codable {
    let influencer_id: Int
    let influencer_name: String
    let influencer_photo: String?
    let price: Int
    let location: String?
    let rating: Double?
    let categories: [String]
    let engagement_rate: Double?
}

struct InfluencerRatePrice: Codable {
    let influencer_id: Int
    let rate: Int
}
