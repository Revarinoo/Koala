//
//  HttpUtility.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 17/10/21.
//

import Foundation
import SwiftUI

final class HttpUtility {
    
    static let shared = HttpUtility()
    static let endpoint = "http://127.0.0.1:8000/api/"
    //"https://koala-influencer.xyz/api/"
    static let defaultImages = "https://koala-influencer.xyz/storage/images/default.png"
    
    private init(){}
    
    public let headers = [
        "x-rapidapi-host": "instagram85.p.rapidapi.com",
        "x-rapidapi-key": "32c4823b31msh53983721fa48c01p1e2eb1jsn522bafce4eef"] // Change with valid Rapid API Key
    
    func request<T:Decodable>(_ urlRequest: URLRequest, resultType:T.Type, completionHandler:@escaping(_ result: T?)-> Void) {

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                
            if(error == nil && data != nil) {
                let response = try? JSONDecoder().decode(resultType.self, from: data!)
                _ = completionHandler(response)
            }
        }.resume()
    }
}
