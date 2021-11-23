//
//  OrderListModel.swift
//  Koala
//
//  Created by Revarino Putra on 22/11/21.
//

import Foundation

struct OrderListResponse: Codable {
    let code: Int
    let message: String
    let data: [OrderList]
}

struct OrderList: Codable {
    let order_id: Int
    let content_id: Int
    let status: String
    let campaign_name: String
    let start_date: String
    let end_date: String
    let photo: String
}

struct OrderListModel: Identifiable {
    let id = UUID()
    let orderId: Int
    let campaingId: Int
    let campaignStatus: String
    let campaignName: String
    let startDate: String
    let endDate: String
    let campaignLogo: String
}
