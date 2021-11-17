//
//  InfluencerListService.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 17/10/21.
//

import Foundation

struct InfluencerListService {
    
    func getInfluencerList(completionHandler:@escaping(_ result: InfluencerListResponse?)->Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: HttpUtility.endpoint + "influencers")! as URL)
        request.allHTTPHeaderFields = HttpUtility.shared.headers

        HttpUtility.shared.request(request as URLRequest, resultType: InfluencerListResponse.self) { response in
            _ = completionHandler(response)
        }
    }
    
    func getInfluencerByCategory(_ category: String, completionHandler:@escaping(_ result: InfluencerListResponse?)->Void) {
        
        let escapedString = category.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let request = NSMutableURLRequest(url: NSURL(string: HttpUtility.endpoint + "influencers/" + escapedString)! as URL)
        
        request.allHTTPHeaderFields = HttpUtility.shared.headers

        HttpUtility.shared.request(request as URLRequest, resultType: InfluencerListResponse.self) { response in
            _ = completionHandler(response)
        }
    }
}
