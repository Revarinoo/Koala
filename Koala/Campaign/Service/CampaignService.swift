//
//  CampaignListService.swift
//  Koala
//
//  Created by Jonathan Clive on 27/10/21.
//

import Foundation

struct CampaignService {
    
    func getCampaign(completionHandler:@escaping(_ result: CampaignResponse?)->Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://127.0.0.1:8000/api/campaign")! as URL)
        request.allHTTPHeaderFields = HttpUtility.shared.headers

        HttpUtility.shared.request(request as URLRequest, resultType: CampaignResponse.self) { response in
            _ = completionHandler(response)
        }
    }
}
