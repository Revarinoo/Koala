//
//  BusinessReportView.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 09/11/21.
//

import SwiftUI

struct BusinessReportView: View {
    
    @StateObject var reportingVM = BusinessReportViewModel()
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .topLeading) {
                Color.bgColorView.edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading) {
//                    HStack {
//                        Spacer()
//                        Text("Business Report")
//                            .font(Font.custom(ThemeFont.poppinsSemiBold, size: 17))
//                            .padding(.trailing)
//                        Spacer()
//                    }
//                    .padding(.bottom, 8)
                    
                    Text("This Month")
                        .font(Font.custom(ThemeFont.poppinsSemiBold, size: 14))
                        .padding(.top, 10)
                    
                    HStack {
                        Text("\(reportingVM.reportingData.thisMonthExpense)")
                            .font(Font.custom(ThemeFont.poppinsSemiBold, size: 24))
                            .foregroundColor(ThemeColor.primary)
                        
                        Text("IDR")
                            .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                            .foregroundColor(Color(hex: "FFB19D"))
                    }
                    Spacer()
                    LineChartView(data: reportingVM.reportingData.chartData, label: reportingVM.reportingData.label, title: "Line chart", legend: "Basic")
                        .padding(EdgeInsets(top: 48, leading: -16, bottom: 16, trailing: -16))
                    Spacer()
                    Text("Overview")
                        .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                    BusinessReportCard(iconName: "avgReach", reportType: "Reach", value: Double(reportingVM.reportingData.overviewData.avgReach.data) ?? 0, percentage: Double(reportingVM.reportingData.overviewData.avgReach.diff) ?? 0.0)
                    BusinessReportCard(iconName: "avgImpression", reportType: "Impression", value: Double(reportingVM.reportingData.overviewData.avgImpression.data) ?? 0.0, percentage: Double(reportingVM.reportingData.overviewData.avgImpression.diff) ?? 0.0)
                    BusinessReportCard(iconName: "avgER", reportType: "Engagement Rate", value: Double(reportingVM.reportingData.overviewData.avgER.data) ?? 0.0, percentage: Double(reportingVM.reportingData.overviewData.avgER.diff) ?? 0.0)
                        .padding(.bottom)
                }
                .padding(.horizontal)
            }
            .navigationBarTitle("Business Report")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(false)
            .navigationBarBackButtonHidden(false)
            .onAppear() {
                reportingVM.getBusinessReport()
            }
        }
        
    }
}

struct BusinessReportView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessReportView()
    }
}
