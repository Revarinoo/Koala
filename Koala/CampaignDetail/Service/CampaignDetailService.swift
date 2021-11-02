//
//  CampaignDetailService.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 02/11/21.
//

import Foundation

struct CampaignDetailService {
    
    func getCampaignDetail(_ id: Int, completionHandler:@escaping(_ result: CampaignDetailResponse?)->Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://127.0.0.1:8000/api/campaign/detail/\(id)")! as URL)
        request.allHTTPHeaderFields = HttpUtility.shared.headers

        HttpUtility.shared.request(request as URLRequest, resultType: CampaignDetailResponse.self) { response in
            _ = completionHandler(response)
        }
    }
}
