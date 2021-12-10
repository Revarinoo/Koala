//
//  ReportingModel.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 12/11/21.
//

import Foundation

struct ReportingModel {
    var thisMonthExpense: Int = 0
    var chartData: [Double] = []
    var label: [String] = []
    var overviewData: OverviewDataModel = OverviewDataModel()
}

struct OverviewDataModel {
    var avgReach: AvgDataModel = AvgDataModel()
    var avgImpression: AvgDataModel = AvgDataModel()
    var avgER: AvgDataModel = AvgDataModel()
}

struct AvgDataModel {
    var data = ""
    var diff = "100"
}
