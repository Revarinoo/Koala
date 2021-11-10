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
    static let endpoint = "http://34.124.208.0/Koala-backend/public/api/"
    static let defaultImages = "http://34.124.208.0/Koala-backend/public/storage/images/default.png"
    
    private init(){}
    
    public let headers = [
        "x-rapidapi-host": "instagram85.p.rapidapi.com",
        "x-rapidapi-key": "9a25a8b9dcmsh2dd84681963ec6fp1786eejsn1904b13c01a1"] // Change with valid Rapid API Key
    
    func request<T:Decodable>(_ urlRequest: URLRequest, resultType:T.Type, completionHandler:@escaping(_ result: T?)-> Void) {

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if(error == nil && data != nil) {
                let response = try? JSONDecoder().decode(resultType.self, from: data!)
                _ = completionHandler(response)
            }
        }.resume()
    }
}
