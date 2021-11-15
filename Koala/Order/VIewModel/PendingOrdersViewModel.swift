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
                            if (order.product_data[index].product_type == "Instagram Story"){
                                productType.append("Story")
                            } else if (order.product_data[index].product_type == "Instagram Post"){
                                productType.append("Post")
                            } else if (order.product_data[index].product_type == "Instagram Reels"){
                                productType.append("Reels")
                            }
                            if let reach = order.product_data[index].reach{
                                reachArr.append(reach)
                            }
                            if let impression = order.product_data[index].impression{
                                impressionArr.append(impression)
                            }
                            if let er = order.product_data[index].er{
                                erArr.append(er)
                            }
                        }
                        //let dt = order.order_date.dateFormatter(dateBefore: order.order_date)
                        avgReach = reachArr.reduce(0, +)/reachArr.count
                        avgImpression = impressionArr.reduce(0, +)/impressionArr.count
                        avgER = erArr.average
                    }
                    let myorder = MyOrders(orderID: order.order_id, name: order.influencer_name, photo: order.influencer_photo, dueDate: order.order_date.dateFormatter(dateBefore: order.order_date), eR: String(avgER),orderStatus: order.status,  productType: productType, avgReach: String(Double(avgReach).thousandsFormatter()), avgImpression: String(Double(avgImpression).thousandsFormatter()), avgER: avgER)
                    orderData.append(myorder)
                }
            }
            DispatchQueue.main.async {
                self.orders = orderData
                self.pendingOrders = orderData.filter({$0.orderStatus == "Pending"})
                self.ongoingOrders = orderData.filter({$0.orderStatus == "On Going"})
                self.completedOrders = orderData.filter({$0.orderStatus == "Completed"})
//                print("INI YG BARU \(orderData)")
            }
        }
    }
    
    func cancelOrder(order_id: Int){
        
        orderService.cancelOrder(order_id){ response in
            if let code = response?.code, let message = response?.message {
                if code == 201{
                    DispatchQueue.main.async {
                        print(response)
                    }
                }
                else {
                    DispatchQueue.main.async {
                        print(response)
                    }
                }
            }
        }
    }
}

//private func dateFormatter(dateBefore: String) -> Date {
//        let dateFormatterGet = DateFormatter()
//        dateFormatterGet.dateFormat = "yyyy-MM-dd"
//
//        return dateFormatterGet.date(from: dateBefore) ?? Date()
//    }
