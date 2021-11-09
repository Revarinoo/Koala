//
//  ContentRequest.swift
//  Koala
//
//  Created by Sholihatul Richas on 05/11/21.
//

import Foundation
import UIKit
import SwiftUI

struct CreateCampaignRequest: Encodable {
    let campaign_logo : Data?
    let name : String
    let description : String
    let start_date: String
    let end_date: String
    let product_name : String
    let rules : String
    let references : [Data]
}

struct CreateCampaignResponse: Decodable {
    let content_id: Int?
    let code: Int?
    let message : String?
}

struct CreateCampaignDetail : Encodable {
    let content_id: Int
    let content_type: String
    let instruction: String
}

struct CreateCampaignDetailResponse : Codable{
    let message : String?
    let code: Int?
}

struct CreateCampaignModel {
    var logo : UIImage = UIImage()
    var title : String = String()
    var startDate : Date = Date()
    var endDate : Date = Date()
    var product : String = String()
    var description : String = String()
    var rules : String = String()
    var references : [UIImage] = []
    var contents : [CreateContentModel] = []
    
}

struct CreateContentModel {
    var contentID = UUID().hashValue
    var contentType : productType.RawValue
    var contentDetail : String
    var isDeleted : Bool
}
