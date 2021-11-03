//
//  RescheduleViewModel.swift
//  Koala
//
//  Created by Clara Anggraini on 03/11/21.
//

import Foundation
import SwiftUI

class RescheduleViewModel: ObservableObject{
    
    private let orderService: MyOrderService = MyOrderService()
    
    func rescheduleCampaign(orderID: Int, schedule: Date){
        var orderData : [MyOrders] = []
        
        orderService.rescheduleCampaign(orderID: orderID, schedule){ response in
            if let code = response?.code, let message = response?.message {
                if code == 201{
                    DispatchQueue.main.async {
                        print(response?.message)
                    }
                }
                else {
                    DispatchQueue.main.async {
                        print(response?.message)
                    }
                }
            }
        }
    }
}
