//
//  Campaign.swift
//  Koala
//
//  Created by Jonathan Clive on 26/10/21.
//

import Foundation

struct CampaignResponse: Codable {
    let data: [Campaign]?
    let code: Int
    let message: String
}

struct Campaign: Codable {
    let content_id: Int?
    let name: String?
    let photo: String?
    let schedule: String?
    let status: String?
    let type: [String]?
}
