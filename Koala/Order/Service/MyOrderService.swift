//
//  MyOrderService.swift
//  Koala
//
//  Created by Sholihatul Richas on 27/10/21.
//

import Foundation
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
    func getMyOrder(completionHandler:@escaping(_ result: OrderResponse?)->Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string:  "http://127.0.0.1:8000/api/business/order")! as URL)
        request.allHTTPHeaderFields = HttpUtility.shared.headers

        HttpUtility.shared.request(request as URLRequest, resultType: OrderResponse.self) { response in
            _ = completionHandler(response)
            //print(response)
        }
        
    }
}
