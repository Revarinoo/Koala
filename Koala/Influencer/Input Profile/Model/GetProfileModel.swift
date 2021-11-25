//
//  GetProfileModel.swift
//  Koala
//
//  Created by Sholihatul Richas on 25/11/21.
//

import Foundation

struct GetProfileResponse : Codable {
    let code : Int
    let message : String
    let influencer_name : String
    let photo : String
    let email : String
    let instagram : String
    let location : String
    let specialty : [Specialties]
    let products : [InfluencerPrice]
}

struct InfluencerPrice : Codable {
    let product_type : String
    let min_rate : Int
    let max_rate : Int
}

struct Specialties : Codable {
    let name : String
}


struct InfluencerProfileData {
    var name : String
    var email : String
    var instagram : String
    var location : String
    var specialty : [String]
    var storyMax : Int
    var storyMin : Int
    var postMax : Int
    var postMin : Int
    var reelsMax : Int
    var reelsMin : Int
}
