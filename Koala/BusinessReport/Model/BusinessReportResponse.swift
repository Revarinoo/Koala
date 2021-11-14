//
//  BusinessReportResponse.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 12/11/21.
//

import Foundation

struct BusinessReportResponse: Codable {
    let reports: [Report]?
    let code: Int
}

struct Report: Codable {
    let month: Int?
    let total_expense: Int?
    let overview_data: OverviewData?
}

struct OverviewData: Codable {
    let avg_reach: AvgReach?
    let avg_impression: AvgImpression?
    let avg_er: AvgEr?
}

struct AvgReach: Codable {
    let data: Double?
    let diff: Double?
}

struct AvgImpression: Codable {
    let data: Double?
    let diff: Double?
}

struct AvgEr: Codable {
    let data: Double?
    let diff: Double?
}
