//
//  CampaignListService.swift
//  Koala
//
//  Created by Jonathan Clive on 27/10/21.
//

import Foundation
import SwiftUI

struct CampaignService {
    @AppStorage("JWT", store: .standard) var token = ""
    func getCampaign(completionHandler:@escaping(_ result: CampaignResponse?)->Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: HttpUtility.endpoint + "campaign")! as URL)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        HttpUtility.shared.request(request as URLRequest, resultType: CampaignResponse.self) { response in
            _ = completionHandler(response)
        }
    }
    
    func postOrder(_ postRequest: CampaignOrderRequest, completionHandler:@escaping(_ result: CampaignDetailResponse?)->Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: HttpUtility.endpoint + "order/create")! as URL)
        request.httpMethod = "post"
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.httpBody = try? JSONEncoder().encode(postRequest)

        HttpUtility.shared.request(request as URLRequest, resultType: CampaignDetailResponse.self) { response in
            completionHandler(response)
        }
    }
}
