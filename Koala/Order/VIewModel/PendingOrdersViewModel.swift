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
                    var productType : [productTypeModel] = []
                    
                    if order.product_data.count > 0 {
                        for index in 0..<order.product_data.count{
                            if (order.product_data[index].product_type == "Instagram Story"){
                                productType.append(productTypeModel(productType: "Story", data1: order.product_data[index].data1 ?? 0, data2: order.product_data[index].data2 ?? 0, er: order.product_data[index].er ?? 0))
                            } else if (order.product_data[index].product_type == "Instagram Post"){
                                productType.append(productTypeModel(productType: "Post", data1: order.product_data[index].data1 ?? 0, data2: order.product_data[index].data2 ?? 0, er: order.product_data[index].er ?? 0))
                            } else if (order.product_data[index].product_type == "Instagram Reels"){
                                productType.append(productTypeModel(productType: "Reels", data1: order.product_data[index].data1 ?? 0, data2: order.product_data[index].data2 ?? 0, er: order.product_data[index].er ?? 0))
                            }
                        }
                    }
                    let myorder = MyOrders(orderID: order.order_id, name: order.influencer_name, photo: order.influencer_photo, dueDate: order.order_date.dateFormatter(dateBefore: order.order_date),orderStatus: order.status, availableToPay: order.availableToPay == 1 ? true : false, productType: productType)
                    orderData.append(myorder)
                }
            }
            DispatchQueue.main.async {
                self.orders = orderData
                self.pendingOrders = orderData.filter({$0.orderStatus == "Pending" || $0.orderStatus == "Accepted"})
                self.ongoingOrders = orderData.filter({$0.orderStatus == "On Going"})
                self.completedOrders = orderData.filter({$0.orderStatus == "Completed"})
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
