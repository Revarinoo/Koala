//
//  ThumbnailImageFetcher.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 28/11/21.
//

import Foundation

struct ThumbnailImageFetcher {
    
    enum ThumbnailImageFetcherError: Error {
        case invalidURL
        case missingData
    }
    
    func fetchInfo(_ mediaURL: String, completion: @escaping (Result<InstaMediaData, Error>) -> Void) {
        
        // Create URL
        print(mediaURL)
        guard let url = URL(string: "https://instagram85.p.rapidapi.com/media/\(mediaURL)") else {
            completion(.failure(ThumbnailImageFetcherError.invalidURL))
            return
        }
        
        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 20.0)
        request.httpMethod = "GET"
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
                completion(.failure(ThumbnailImageFetcherError.missingData))
                return
            }
            
            do {
                // Parse the JSON data
                print("Parse the JSON data")
                print(data.prettyPrintedJSONString)
                let instaAccountResult = try JSONDecoder().decode(InstaMediaModel.self, from: data)
                completion(.success(instaAccountResult.data))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
}
