//
//  InstaAccModel.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 17/10/21.
//

import Foundation

struct InstaAccModel: Codable {
    let code: Int
    let message: String
    let data: AccountData
}

struct AccountData: Codable {
    let username: String
    let figures: AccStats
}

struct AccStats: Codable {
    let posts: Int
    let followers: Int
    let followings: Int
}
