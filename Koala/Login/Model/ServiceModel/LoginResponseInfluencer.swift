//
//  LoginResponseInfluencer.swift
//  Koala
//
//  Created by Jonathan Clive on 20/10/21.
//  Edited by Syahrul Fadholi

import Foundation

struct LoginResponseInfluencer: Decodable {
    let influencer: Influencer
    let token: String
}

struct Influencer: Decodable {
    let id: Int
    let rating: Double?
    let contact_email: String?
    let engagement_rate: Double?
    let user_id: Int
}
