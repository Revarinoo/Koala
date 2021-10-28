//
//  ReviewServiceModel.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 28/10/21.
//

import Foundation

struct ReviewRequest: Codable {
    let order_id: Int
    var comment: String
    var rating: Int
}

struct ReviewResponse: Codable {
    let code: Int
    let message: String
}
