//
//  CampaignDetailModel.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 02/11/21.
//

import Foundation

struct CampaignDetailModel: Identifiable {
    var id: UUID = UUID()
    var contentId: Int = 0
    var contentType: String = ""
    var instruction: String = ""
}
