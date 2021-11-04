//
//  CampaignUpcomingModel.swift
//  Koala
//
//  Created by Revarino Putra on 03/11/21.
//

import Foundation

struct CampaignUpcomingModel: Identifiable {
    var id = UUID()
    var campaign_logo: String = ""
    var campaign_title: String = ""
    var due_date: String = ""
    var product: String = ""
    var description: String = ""
    var rules: String = ""
    var references: [String] = [""]
}

struct CampaignDetailUpcomingModel: Identifiable {
    var id = UUID()
    var content_type: String = ""
    var content_detail: String = ""
}
