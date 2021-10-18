//
//  InfluencerListService.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 17/10/21.
//

import Foundation

struct InfluencerListService {
    
    func getInfluencerList(completionHandler:@escaping(_ result: InfluencerListResponse?)->Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://127.0.0.1:8000/api/influencers")! as URL)
        request.allHTTPHeaderFields = HttpUtility.shared.headers

        HttpUtility.shared.request(request as URLRequest, resultType: InfluencerListResponse.self) { response in
            _ = completionHandler(response)
        }
    }
    
    func getInfluencerRatePrice(_ influencerID: Int, completionHandler:@escaping(_ result: InfluencerRatePrice?)->Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://127.0.0.1:8000/api/influencer/rate/\(influencerID)")! as URL)
        request.allHTTPHeaderFields = HttpUtility.shared.headers

        HttpUtility.shared.request(request as URLRequest, resultType: InfluencerRatePrice.self) { response in
            _ = completionHandler(response)
        }
    }
}
