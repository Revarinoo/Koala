//
//  Payment.swift
//  Koala
//
//  Created by Clara Anggraini on 23/11/21.
//

import Foundation

struct PaymentProcessResponse: Decodable{
    var order_id: Int
    var token: String
    var payment_url: String
    var payment_status: String
    var code: Int
}

struct PaymentProcess{
    var order_id: Int
    var token: String
    var payment_url: String
    var payment_status: String
}
