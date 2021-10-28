//
//  ReviewModel.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 28/10/21.
//

import Foundation

struct ReviewModel: Codable {
    var order_id: Int = 0
    var comment: String = ""
    var ratign: Int = 0
}

struct ReviewResponse: Codable {
    let code: Int
    let message: String
}
