//
//  PendingOrders.swift
//  Koala
//
//  Created by Sholihatul Richas on 27/10/21.
//

import Foundation
import SwiftUI

class OrderViewModel: ObservableObject{
    
    @Published var orders : [MyOrders] = []
    @Published var pendingOrders : [MyOrders] = []
    @Published var ongoingOrders : [MyOrders] = []
    @Published var completedOrders : [MyOrders] = []
    
    private let orderService: MyOrderService = MyOrderService()
    
    func callData(){
        var orderData : [MyOrders] = []
        
        orderService.getMyOrder(){ response in
            if let responseData = response?.data{
                for order in responseData{
                    var avgReach = 0
                    var avgImpression = 0
                    var avgER : Double = 0
                    var productType : [String] = []
                    
                    if order.product_data.count > 0 {
                        
                        var reachArr : [Int] = []
                        var impressionArr : [Int] = []
                        var erArr : [Double] = []
                        
                        for index in 0..<order.product_data.count{
                            productType.append(order.product_data[index].product_type)
                            reachArr.append(order.product_data[index].reach ?? 0)
                            impressionArr.append(order.product_data[index].impression ?? 0)
                            erArr.append(order.product_data[index].er ?? 0)
                        }
                        
                        avgReach = reachArr.reduce(0, +)/reachArr.count
                        avgImpression = impressionArr.reduce(0, +)/impressionArr.count
                        avgER = erArr.average
                    }
                    let myorder = MyOrders(orderID: order.order_id, name: order.influencer_name, photo: order.influencer_photo, dueDate: order.order_date, eR: String(avgER),orderStatus: order.status,  productType: productType, avgReach: String(Double(avgReach).thousandsFormatter()), avgImpression: String(Double(avgImpression).thousandsFormatter()), avgER: avgER)
                    orderData.append(myorder)
                }
            }
            DispatchQueue.main.async {
                self.orders = orderData
                self.pendingOrders = orderData.filter({$0.orderStatus == "Pending"})
                self.ongoingOrders = orderData.filter({$0.orderStatus == "Ongoing"})
                self.completedOrders = orderData.filter({$0.orderStatus == "Completed"})
                //print("INI YG BARU \(orderData)")
            }
        }
    }
}

