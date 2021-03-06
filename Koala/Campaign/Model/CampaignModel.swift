//
//  CampaignRequest.swift
//  Koala
//
//  Created by Jonathan Clive on 28/10/21.
//

import Foundation

struct CampaignModel: Identifiable {
    var id: UUID = UUID()
    var content_id: Int = 0
    var name: String = ""
    var photo: String = ""
    var schedule: Date = Date()
    var status: String = ""
    var type: [String] = []
}
