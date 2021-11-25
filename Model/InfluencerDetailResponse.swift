//
//  InfluencerDetail.swift
//  Koala
//
//  Created by Clara Anggraini on 25/10/21.
//

import Foundation

struct InfluencerDetailResponse: Codable {
    let influencer_profile: InfluencerProfileResponse?
    let categories: [String]?
    let platforms: [PlatformResponse]
    let products: [ProductResponse]
    let projects: [ProjectResponse]?
}

struct InfluencerProfileResponse: Codable{
    let id: Int
    let contact_email: String
    let name: String
    let location: String?
    let photo: String?
    let user_id: Int
    let engagement_rate: Double?
    let rating: Int
}

struct PlatformResponse: Codable{
    let id: Int
    let name: String
    let socialmedia_id: String
    let followers: Int
    let average_likes: Double?
    let average_comments: Double?
}

struct ProductResponse: Codable{
    let content_type: String
    let minPrice: Int
    let maxPrice: Int
}

struct ProjectResponse: Codable{
    let order_id: Int
    let business_photo: String?
    let business_name: String
    let total_likes: String
    let total_comments: String
    let engagement_rate: String
    let comment: String?
}
