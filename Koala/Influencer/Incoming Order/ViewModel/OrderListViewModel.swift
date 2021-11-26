//
//  OrderListViewModel.swift
//  Koala
//
//  Created by Revarino Putra on 22/11/21.
//

import Foundation

class OrderListViewModel: ObservableObject {
    private let orderListService = OrderListService()
    @Published var incomingOrders: [OrderListModel] = []
    @Published var ongoingOrders: [OrderListModel] = []
    @Published var completedOrders: [OrderListModel] = []
    
    func fetchOrderList() {
        orderListService.getOrderList { result in
            if let response = result {
                var temp: [OrderListModel] = []
                for data in response.data {
                    temp.append(OrderListModel(orderId: data.order_id, campaingId: data.content_id, campaignStatus: data.status, campaignName: data.campaign_name, startDate: self.dateFormatter(dateBefore: data.start_date), endDate: self.dateFormatter(dateBefore: data.end_date), campaignLogo: data.photo))
                }
                
                DispatchQueue.main.async {
                    self.incomingOrders = temp.filter{ $0.campaignStatus == "Pending" || $0.campaignStatus == "Accepted" }
                    self.ongoingOrders = temp.filter{ $0.campaignStatus == "On Going" }
                    self.completedOrders = temp.filter{ $0.campaignStatus == "Completed" }
                }
            }
        }
    }
    
    private func dateFormatter(dateBefore: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "dd-MM-yyyy"
        let dateAfter = dateFormatterGet.date(from: dateBefore) ?? Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter.string(from: dateAfter)
    }
}
