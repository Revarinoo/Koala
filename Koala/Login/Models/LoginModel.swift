//
//  LoginModel.swift
//  Koala
//
//  Created by Jonathan Clive on 20/10/21.
//

import Foundation

struct LoginModel: Identifiable {
    var id: Int = 0
    var name: String = ""
    var photo: String = ""
    var location: String = ""
    var rating: Double = 0.0
    var category: [String] = [""]
    var ratePrice: Int = 0
    var rateEngagement: Double = 0.0
}
