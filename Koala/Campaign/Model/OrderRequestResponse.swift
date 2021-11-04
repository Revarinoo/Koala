//
//  OrderRequestResponse.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 03/11/21.
//

import Foundation

struct CampaignOrderRequest: Encodable {
    let status: String = OrderStatus.pending.rawValue
    let order_date: String
    let content_id: Int
    let influencer_id: Int
}

struct CampaignOrderResponse: Codable {
    let code: Int?
    let message: String?
}
