//
//  InstagramService.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 17/10/21.
//

import Foundation

struct InstagramService {
    
    func getAccInfo(username: String, completionHandler:@escaping(_ result: InstaAccModel?)->Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://instagram85.p.rapidapi.com/account/\(username)/info")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.allHTTPHeaderFields = HttpUtility.shared.headers

        HttpUtility.shared.request(request as URLRequest, resultType: InstaAccModel.self) { response in
            print(response?.code)
            _ = completionHandler(response)
        }
    }
    
    func getFeedData(username: String, completionHandler:@escaping(_ result: InstaFeedModel?)->Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://instagram85.p.rapidapi.com/account/\(username)/feed?by=username")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.allHTTPHeaderFields = HttpUtility.shared.headers

        HttpUtility.shared.request(request as URLRequest, resultType: InstaFeedModel.self) { response in
            _ = completionHandler(response)
        }
    }
}
