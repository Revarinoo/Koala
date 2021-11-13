//
//  ReportingModel.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 12/11/21.
//

import Foundation

struct ReportingModel {
    var thisMonthExpense: Int = 0
    var chartData: [Int] = []
    var label: [String] = []
    var avgReach: Double = 0.0
    var diffReach: Double = 0.0
    var avgImpression: Double = 0.0
    var diffImpression: Double = 0.0
    var avgER: Double = 0.0
    var diffER: Double = 0.0
}
