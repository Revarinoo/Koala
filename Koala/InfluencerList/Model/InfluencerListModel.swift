//
//  InfluencerModel.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 17/10/21.
//

import Foundation

struct InfluencerListModel: Identifiable {
    var id: Int = 0
    var name: String = ""
    var photo: String = ""
    var location: String = ""
    var rating: Double = 0.0
    var category: [String] = [""]
    var ratePrice: Int = 0
    var rateEngagement: Double = 0.0
}
