//
//  MyOrders.swift
//  Koala
//
//  Created by Sholihatul Richas on 27/10/21.
//

import Foundation

struct MyOrders: Identifiable{
    let id = UUID()
    let orderID : Int
    var name: String
    var photo: String
    var dueDate: String
    var eR : String
    var orderStatus : String
    var productType: [String]
    var avgReach : String
    var avgImpression: String
    var avgER: Double
}
