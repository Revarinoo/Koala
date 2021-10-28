//
//  Campaign.swift
//  Koala
//
//  Created by Jonathan Clive on 26/10/21.
//

import Foundation

struct Campaigns: Codable {
    let data: [Campaign]
    let message: String
    let code: Int
}

struct Campaign: Codable {
    let name: String
    let photo: String
    let schedule: String
    let status: String
}
