//
//  MyOrderService.swift
//  Koala
//
//  Created by Sholihatul Richas on 27/10/21.
//

import Foundation
import SwiftUI
//final class HttpUtility {
//
//    static let shared = HttpUtility()
//    static let endpoint = "http://127.0.0.1:8000/api/"
//    private init(){}
//
//    public let headers = [
//        "x-rapidapi-host": "instagram85.p.rapidapi.com",
//        "x-rapidapi-key": "9a25a8b9dcmsh2dd84681963ec6fp1786eejsn1904b13c01a1"]//,
//        //"Authorization": "Bearer \(UserDefaults.standard.object(forKey: "JWT")!)"] // Change with valid Rapid API Key
//
//    func request<T:Decodable>(_ urlRequest: URLRequest, resultType:T.Type, completionHandler:@escaping(_ result: T?)-> Void) {
//        //print(UserDefaults.standard.object(forKey: "JWT")!)
//        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
//            if(error == nil && data != nil) {
//                let response = try? JSONDecoder().decode(resultType.self, from: data!)
//                _ = completionHandler(response)
//            }
//        }.resume()
//    }
//}
struct MyOrderService{
    
    @AppStorage("JWT", store: .standard) var token = ""
    
    func getMyOrder(completionHandler:@escaping(_ result: OrderResponse?)->Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string:  "http://127.0.0.1:8000/api/business/order")! as URL)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
       
        HttpUtility.shared.request(request as URLRequest, resultType: OrderResponse.self) { response in
            _ = completionHandler(response)
          
        }
        
    }

    func rescheduleCampaign(_ postRequest: RescheduleRequest, completionHandler:@escaping(_ result: RescheduleResponse?)->Void) {
        guard let url = URL(string: "http://127.0.0.1:8000/api/order/reschedule") else {
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
