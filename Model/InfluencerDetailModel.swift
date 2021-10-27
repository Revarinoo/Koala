//
//  InfluencerDetailModel.swift
//  Koala
//
//  Created by Clara Anggraini on 25/10/21.
//

import Foundation

struct InfluencerDetailModel: Identifiable {
    let id: Int
    let influencer_profile: InfluencerProfileModel
    let categories: [String]
    let platforms: [PlatformModel]
    let analytic_photos: [AnalyticPhotoModel]
    let projects: [ProjectModel]
}

struct InfluencerProfileModel: Identifiable{
    let id: Int
    let contact_email: String
    let name: String
    let location: String
    let photo: String
    let user_id: Int
    let engagement_rate: Double?
}

struct PlatformModel: Identifiable{
    let id: Int
    let name: String
    let socialmedia_id: String
    let followers: Int
    let average_likes: Double
    let average_comments: Double
}

struct ProjectModel: Identifiable{
    let id: Int
    let business_photo: String
    let sum_impressions: Int
    let sum_reach: Int
    let businessOwner_photo: String
    let businessOwner_name: String
    let comment: String
    let rating: Double
}

struct AnalyticPhotoModel: Identifiable{
    let id: Int
    let photo: String
}
