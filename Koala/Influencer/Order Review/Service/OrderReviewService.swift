//
//  OrderReviewService.swift
//  Koala
//
//  Created by Revarino Putra on 25/11/21.
//

import Foundation

class OrderReviewService {
    
    func getOrderReview(orderId: Int, completionHandler: @escaping(_ result: OrderReviewResponse?)-> Void) {
        let request = NSMutableURLRequest(url: NSURL(string: HttpUtility.endpoint + "order/review/\(orderId)")! as URL)
        
        HttpUtility.shared.request(request as URLRequest, resultType: OrderReviewResponse.self) { response in
           completionHandler(response)
        }
    }
}
