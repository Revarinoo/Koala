//
//  CampaignUpcomingService.swift
//  Koala
//
//  Created by Revarino Putra on 03/11/21.
//

import Foundation

class CampaignUpcomingService {
    
    func getUpcomingDetail(id: Int, completionHandler:@escaping(_ result: CampaignUpcomingResponse?)->Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: HttpUtility.endpoint + "campaign/detail/upcoming/\(id)")! as URL)
        
        HttpUtility.shared.request(request as URLRequest, resultType: CampaignUpcomingResponse.self) { response in
            _ = completionHandler(response)
        }
    }
}
