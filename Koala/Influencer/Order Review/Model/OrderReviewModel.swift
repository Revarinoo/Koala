//
//  OrderReviewModel.swift
//  Koala
//
//  Created by Revarino Putra on 25/11/21.
//

import Foundation

struct OrderReviewResponse: Codable {
    let code: Int
    let message: String
    let review: ReviewData
    let business: BusinessData
}

struct ReviewData: Codable {
    let comment: String
    let rating: Int
}

struct BusinessData: Codable {
    let photo: String
    let name: String
}
