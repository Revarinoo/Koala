//
//  RecommendationInfluencerModels.swift
//  Koala
//
//  Created by Sholihatul Richas on 23/10/21.
//

import Foundation

struct RecommendationInfluencerModel: Identifiable {
    var id: Int = 0
    var name: String = ""
    var photo: String = ""
    var category: [String] = [""]
    var price: Int = 0
}
