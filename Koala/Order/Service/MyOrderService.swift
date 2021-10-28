//
//  MyOrderService.swift
//  Koala
//
//  Created by Sholihatul Richas on 27/10/21.
//

import Foundation

struct MyOrderService{
    func getMyOrder(completionHandler:@escaping(_ result: OrderResponse?)->Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: HttpUtility.endpoint + "business/order")! as URL)
        request.allHTTPHeaderFields = HttpUtility.shared.headers

        HttpUtility.shared.request(request as URLRequest, resultType: OrderResponse.self) { response in
            _ = completionHandler(response)
        }
    }
}
