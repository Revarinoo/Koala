//
//  OrderModel.swift
//  Koala
//
//  Created by Sholihatul Richas on 28/10/21.
//

import Foundation

struct OrderResponse: Codable{
    var data: [Order]
}

struct Order: Codable{
    var order_id: Int
    var influencer_name: String
    var influencer_photo: String
    var content_id: Int
    var order_date: String
    var status: String
    var product_data : [OrderProductData]
}

struct OrderProductData: Codable{
    var product_type: String
    var reach: Int?
    var impression: Int?
    var er: Double?
}
