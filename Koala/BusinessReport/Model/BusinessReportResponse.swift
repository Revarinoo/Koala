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
    let avg_reach: AvgData?
    let avg_impression: AvgData?
    let avg_er: AvgData?
}

struct AvgData: Codable {
    let data: String?
    let diff: String?
}
