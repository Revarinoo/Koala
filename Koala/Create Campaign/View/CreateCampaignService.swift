//
//  CampaignService.swift
//  Koala
//
//  Created by Sholihatul Richas on 07/11/21.
//

import Foundation
import SwiftUI

struct CreateCampaignService{
    
    @AppStorage("JWT", store: .standard) var token = ""
    
    func getCampaign(completionHandler:@escaping(_ result: CreateCampaignResponse?)->Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: HttpUtility.endpoint + "campaign")! as URL)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        HttpUtility.shared.request(request as URLRequest, resultType: CreateCampaignResponse.self) { response in
            _ = completionHandler(response)
        }
    }
    
    func postCreateCampaign(_ postRequest: CreateCampaignRequest, completionHandler:@escaping(_ result: CreateCampaignDetailResponse?)->Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: HttpUtility.endpoint + "campaign/create")! as URL)
        request.httpMethod = "post"
        let boundary = "Boundary-\(UUID().uuidString)"
        //request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(postRequest)

        HttpUtility.shared.request(request as URLRequest, resultType: CreateCampaignDetailResponse.self) { response in
            completionHandler(response)
        }
    }
}
