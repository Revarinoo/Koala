//
//  CampaignService.swift
//  Koala
//
//  Created by Jonathan Clive on 27/10/21.
//

import Foundation

let campaignDefault = UserDefaults.standard

struct CampaignService {
    
    func getCampaign(_ token: String, completionHandler:@escaping(_ result: Campaigns?)->Void) {
        var urlRequest = URLRequest(url: URL(string: HttpUtility.endpoint + "campaign")!)
            urlRequest.httpMethod = "post"
            urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
            urlRequest.httpBody = try? JSONEncoder().encode(CampaignRequest(token: token))

        HttpUtility.shared.request(urlRequest, resultType: Campaigns.self) { response in
           completionHandler(response)
        }
    }
}
