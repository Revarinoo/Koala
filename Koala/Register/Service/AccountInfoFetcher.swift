//
//  AccountInfoFetcher.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 24/10/21.
//

import Foundation

struct AccountInfoFetcher {
    
    enum AccountInfoFetcherError: Error {
        case invalidURL
        case missingData
    }
    
    func fetchInfo(_ username: String, completion: @escaping (Result<AccountData, Error>) -> Void) {
        
        // Create URL
        guard let url = URL(string: "https://instagram85.p.rapidapi.com/account/\(username)/info") else {
            completion(.failure(AccountInfoFetcherError.invalidURL))
            return
        }
        
        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 20.0)
        request.allHTTPHeaderFields = HttpUtility.shared.headers
        
        // Create URL session data task
        URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            
            if let httpResponse = response as? HTTPURLResponse {
                print("statusCode: \(httpResponse.statusCode)")
            }
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(AccountInfoFetcherError.missingData))
                return
            }
            
            do {
                // Parse the JSON data
                let instaAccountResult = try JSONDecoder().decode(InstaAccModel.self, from: data)
                completion(.success(instaAccountResult.data))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
}
