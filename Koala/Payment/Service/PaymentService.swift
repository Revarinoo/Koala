//
//  PaymentService.swift
//  Koala
//
//  Created by Clara Anggraini on 23/11/21.
//

import Foundation

struct PaymentService {
    
    func getPaymentProcess(order_id: Int, completionHandler:@escaping(_ result: PaymentProcessResponse?)->Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: HttpUtility.endpoint + "order/\(order_id)")! as URL)
        
        HttpUtility.shared.request(request as URLRequest, resultType: PaymentProcessResponse.self) { response in
            _ = completionHandler(response)
        }
    }
    
}
