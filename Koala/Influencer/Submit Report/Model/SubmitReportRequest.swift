//
//  SubmitReportRequest.swift
//  Koala
//
//  Created by Revarino Putra on 25/11/21.
//

import Foundation

struct ReportRequest: Encodable {
    let post_url: String?
    let views: Int?
    let likes: Int?
    let comments: Int?
    let reach: Int?
    let impressions: Int?
    let post_photo: String?
    let order_detail_id: Int
}

struct ReportResponse: Decodable {
    let code: Int
    let message: String
}
