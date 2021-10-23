//
//  HttpUtility.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 17/10/21.
//

import Foundation

final class HttpUtility {
    
    static let shared = HttpUtility()
    static let endpoint = "http://127.0.0.1:8000/api/"
    private init(){}
    
    public let headers = [
        "x-rapidapi-host": "instagram85.p.rapidapi.com",
        "x-rapidapi-key": "972dec3e88msh0481a1317c5f2acp1281aajsn0ccb5fdf65db" ]

    func request<T:Decodable>(_ urlRequest: URLRequest, resultType:T.Type, completionHandler:@escaping(_ reuslt: T?)-> Void) {

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if(error == nil && data != nil) {
                let response = try? JSONDecoder().decode(resultType.self, from: data!)
                _ = completionHandler(response)
            }
        }.resume()
    }
}
