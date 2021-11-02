//
//  InfluencerDetailService.swift
//  Koala
//
//  Created by Clara Anggraini on 25/10/21.
//

import Foundation

struct InfluencerDetailService {
    
    func getInfluencerDetail(_ influencerID: Int, completionHandler:@escaping(_ result: InfluencerDetailResponse?)->Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: HttpUtility.endpoint + "influencer/\(influencerID)")! as URL)
        request.allHTTPHeaderFields = HttpUtility.shared.headers
        
        HttpUtility.shared.request(request as URLRequest, resultType: InfluencerDetailResponse.self) { response in
            _ = completionHandler(response)
        }
    }
}