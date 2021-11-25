//
//  GetProfileModel.swift
//  Koala
//
//  Created by Sholihatul Richas on 25/11/21.
//

import Foundation

struct GetProfile : Codable {
    let name : String
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
