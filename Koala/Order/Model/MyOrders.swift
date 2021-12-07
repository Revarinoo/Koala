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
    var orderStatus : String
    var availableToPay: Bool
    var productType: [productTypeModel]
}

struct productTypeModel: Identifiable{
    let id = UUID()
    var productType: String
    var data1: Int
    var data2: Int
    var er: Double
}
