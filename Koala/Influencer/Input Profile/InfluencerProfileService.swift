//
//  InfluencerProfileService.swift
//  Koala
//
//  Created by Sholihatul Richas on 24/11/21.
//

import Foundation
import SwiftUI
import Alamofire

struct InfluencerService{
    
    @AppStorage("JWT", store: .standard) var token = ""
    let tkn = "1|m537lhpvOSjSVy8crTgJYZQOL6xCC5d0ouxnl3Nn"
    func getCampaign(completionHandler:@escaping(_ result: CreateCampaignResponse?)->Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: HttpUtility.endpoint + "campaign")! as URL)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        HttpUtility.shared.request(request as URLRequest, resultType: CreateCampaignResponse.self) { response in
            _ = completionHandler(response)
        }
    }
    
    func postCreateCampaign(_ postRequest: UpdateProfileModelRequest, completionHandler:@escaping(_ result: UpdateInfluencerProfileResponse?)->Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: HttpUtility.endpoint + "profile/update")! as URL)
        request.httpMethod = "post"
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpBody = try? JSONEncoder().encode(postRequest)

        HttpUtility.shared.request(request as URLRequest, resultType: UpdateInfluencerProfileResponse.self) { response in
            completionHandler(response)
        }
    }
}
