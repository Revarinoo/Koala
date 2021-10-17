//
//  HttpUtility.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 17/10/21.
//

import Foundation

final class HttpUtility {
    
    static let shared = HttpUtility()
    private init(){}
    
    public let headers = [
        "x-rapidapi-host": "instagram85.p.rapidapi.com",
        "x-rapidapi-key": "e99168d2c5msh1ad6ce9c2876c8fp12899cjsn07ee76a6797a" ]

    func request<T:Decodable>(_ urlRequest: URLRequest, resultType:T.Type, completionHandler:@escaping(_ reuslt: T?)-> Void) {

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if(error == nil && data != nil) {
                let response = try? JSONDecoder().decode(resultType.self, from: data!)
                _ = completionHandler(response)
            }
        }.resume()
    }
}
