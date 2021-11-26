//
//  PaymentOrderDetailResponse.swift
//  Koala
//
//  Created by Revarino Putra on 25/11/21.
//

import Foundation

struct OrderDetailData: Codable {
    let code: Int
    let message: String
    let campaign_name: String
    let time_period: String
    let detail: [DetailData]
    let influencer: InfluencerOrder
}


struct DetailData: Codable {
    let content_type: String
    let price: Double
}

struct InfluencerOrder: Codable {
    let name: String
    let photo: String
}
