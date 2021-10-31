//
//  Campaign.swift
//  Koala
//
//  Created by Jonathan Clive on 26/10/21.
//

import Foundation

struct CampaignResponse: Codable {
    let data: [Campaign]?
}

struct Campaign: Codable {
    let name: String?
    let photo: [String]?
    let schedule: String?
    let status: String?
}