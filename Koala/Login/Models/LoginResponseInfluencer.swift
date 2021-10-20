//
//  LoginResponseInfluencer.swift
//  Koala
//
//  Created by Jonathan Clive on 20/10/21.
//

import Foundation

struct LoginResponseInfluencer: Codable {
    let influencer: Influencer
    let token: String
}

struct Influencer: Codable {
    let id: Int
    let rating: Double
    let contact_email: String
    let engagement_rate: Double
    let user_id: Int
}
