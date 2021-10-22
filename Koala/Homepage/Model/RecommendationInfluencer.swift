//
//  RecommendationInfluencer.swift
//  Koala
//
//  Created by Sholihatul Richas on 19/10/21.
//

import Foundation

struct RecommendationInfluencers: Codable {
    let rec_influencers: [RecommedationInfluencer]
}

struct RecommedationInfluencer: Codable {
    let influencer_id: Int
    let influencer_name: String
    let influencer_photo: String?
    let price: Int
    let categories: [String]
}

