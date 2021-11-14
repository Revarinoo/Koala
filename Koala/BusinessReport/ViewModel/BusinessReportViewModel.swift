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
        
        reportingService.getReport() { response in
            if let reports = response?.reports {
                thisMonthExpense = reports.first(where: {$0.month == self.thisMonthInt})?.total_expense ?? 0
                
                for report in reports {
                    let monthLabel = DateFormatter().monthSymbols[(report.month ?? 1) - 1]
                    
                    labelsData.append(monthLabel)
                }
            }
            
            DispatchQueue.main.async {
                self.reportingData.thisMonthExpense = thisMonthExpense
                self.reportingData.label = labelsData
                print(self.reportingData.label)
                print(self.reportingData.thisMonthExpense)
            }
        }
    }
}
