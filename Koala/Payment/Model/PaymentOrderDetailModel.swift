//
//  PaymentOrderDetailModel.swift
//  Koala
//
//  Created by Revarino Putra on 25/11/21.
//

import Foundation



struct OrderDetailPaymentModel: Identifiable {
    var id = UUID()
    var campaign_name: String = String()
    var time_period: String = String()
    var detail: [DetailModel] = []
    var influencer: InfluencerOrder = InfluencerOrder(name: "", photo: "")
}

struct DetailModel: Identifiable {
    var id = UUID()
    var content_type: String = String()
    var price: Double = Double()
}
