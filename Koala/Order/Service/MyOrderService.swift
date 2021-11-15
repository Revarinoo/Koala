//
//  MyOrderService.swift
//  Koala
//
//  Created by Sholihatul Richas on 27/10/21.
//

import Foundation
import SwiftUI

struct MyOrderService{
    
    @AppStorage("JWT", store: .standard) var token = ""
    
    func getMyOrder(completionHandler:@escaping(_ result: OrderResponse?)->Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string:  HttpUtility.endpoint + "business/order")! as URL)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
       
        HttpUtility.shared.request(request as URLRequest, resultType: OrderResponse.self) { response in
            _ = completionHandler(response)
          
        }
        
    }

    func rescheduleCampaign(_ postRequest: RescheduleRequest, completionHandler:@escaping(_ result: RescheduleResponse?)->Void) {
        guard let url = URL(string: HttpUtility.endpoint + "order/reschedule") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpBody = try? JSONEncoder().encode(postRequest)
        
        print("Post Request: \(postRequest)")
        HttpUtility.shared.request(request, resultType: RescheduleResponse.self) { response in
            completionHandler(response)
            
        }
    }
    
    func cancelOrder(_ order_id: Int, completionHandler:@escaping(_ result: RescheduleResponse?)->Void) {
        guard let url = URL(string: HttpUtility.endpoint + "order/delete/\(order_id)") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
//        request.httpBody = try? JSONEncoder().encode(order_id)
        
        print("Delete Request: \(order_id)")
        HttpUtility.shared.request(request, resultType: RescheduleResponse.self) { response in
            completionHandler(response)
            
        }
    }

}

struct RescheduleRequest:Codable{
    let order_id: Int?
    let dueDate: String?
}
struct RescheduleResponse: Codable {
    let code: Int?
    let message: String?
    let order_id: Int?
    let dueDate: String?
    
}
