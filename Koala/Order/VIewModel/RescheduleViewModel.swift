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
    
    func rescheduleCampaign(rescheduleRequest: RescheduleRequest){
        
        orderService.rescheduleCampaign(rescheduleRequest){ response in
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
