//
//  SubmitPriceRequestResponse.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 27/11/21.
//

import Foundation

struct SubmitPriceRequest: Encodable {
    let order_detail_id: Int?
    let price: Double?
}

struct SubmitPriceResponse: Decodable {
    let code: Int
    let message: String
}
