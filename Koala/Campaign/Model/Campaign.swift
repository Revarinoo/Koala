//
//  Campaign.swift
//  Koala
//
//  Created by Jonathan Clive on 26/10/21.
//

import Foundation

struct Campaign: Identifiable{
    let id = UUID()
    var campaignPhoto: String
    var campaignName: String
    var campaignPackage: String
    var campaignDate: Date
    var campaignPrice: Int
}
