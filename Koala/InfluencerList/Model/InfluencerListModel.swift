//
//  InfluencerListModel.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 17/10/21.
//

import Foundation

struct InfluencerListModel: Codable {
    let data: [InfluencerData]
}

struct InfluencerData: Codable {
    let influencer_id: Int
    let socialmedia_id: String
    let name: String
    let photo: String?
    let category: String
}

struct InfluencerRatePrice: Codable {
    let influencer_id: Int
    let rate: Int
}
