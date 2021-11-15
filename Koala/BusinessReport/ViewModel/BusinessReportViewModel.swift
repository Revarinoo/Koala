//
//  BusinessReportViewModel.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 12/11/21.
//

import Foundation

class BusinessReportViewModel: ObservableObject {
    
    @Published var reportingData: ReportingModel = ReportingModel()
    private let reportingService: BusinessReportService = BusinessReportService()
    private let thisMonthInt = Calendar.current.component(.month, from: Date())
    
    func getBusinessReport() {
        
        var thisMonthExpense: Int = 0
        var labelsData: [String] = []
        var valueData: [Double] = []
        var overviewData: OverviewDataModel = OverviewDataModel()
        
        reportingService.getReport() { response in
            if let reports = response?.reports {
                thisMonthExpense = reports.first(where: {$0.month == self.thisMonthInt})?.total_expense ?? 0
                
                let avgReachData = reports.first(where: {$0.month == self.thisMonthInt})?.overview_data?.avg_reach?.data ?? "0"
                let avgReachDiff = reports.first(where: {$0.month == self.thisMonthInt})?.overview_data?.avg_reach?.diff ?? "0"
                let avgImpressionData = reports.first(where: {$0.month == self.thisMonthInt})?.overview_data?.avg_impression?.data ?? "0"
                let avgImpressionDiff = reports.first(where: {$0.month == self.thisMonthInt})?.overview_data?.avg_impression?.diff ?? "0"
                let avgErData = reports.first(where: {$0.month == self.thisMonthInt})?.overview_data?.avg_er?.data ?? "0"
                let avgErDiff = reports.first(where: {$0.month == self.thisMonthInt})?.overview_data?.avg_er?.diff ?? "0"
                
                overviewData = OverviewDataModel(avgReach: AvgDataModel(data: avgReachData, diff: avgReachDiff), avgImpression: AvgDataModel(data: avgImpressionData, diff: avgImpressionDiff), avgER: AvgDataModel(data: avgErData, diff: avgErDiff))
                
                for report in reports.prefix(4) {
                    let monthLabel = DateFormatter().monthSymbols[(report.month ?? 1) - 1]
                    let value = Double(report.total_expense ?? 0)
                    
                    labelsData.append(monthLabel[0...2])
                    valueData.append(value)
                }
            }
            
            DispatchQueue.main.async {
                self.reportingData.thisMonthExpense = thisMonthExpense
                self.reportingData.label = labelsData
                self.reportingData.chartData = valueData
                self.reportingData.overviewData = overviewData
            }
        }
    }
}
