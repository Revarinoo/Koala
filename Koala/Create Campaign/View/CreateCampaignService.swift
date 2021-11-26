//
//  CampaignService.swift
//  Koala
//
//  Created by Sholihatul Richas on 07/11/21.
//

import Foundation
import SwiftUI
import Alamofire

struct CreateCampaignService{
    
    @AppStorage("JWT", store: .standard) var token = ""
    let tkn = "1|m537lhpvOSjSVy8crTgJYZQOL6xCC5d0ouxnl3Nn"
    func getCampaign(completionHandler:@escaping(_ result: CreateCampaignResponse?)->Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: HttpUtility.endpoint + "campaign")! as URL)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        HttpUtility.shared.request(request as URLRequest, resultType: CreateCampaignResponse.self) { response in
            _ = completionHandler(response)
        }
    }
    
    func postCreateContent(categories: [String], completionHandler:@escaping(_ result: CreateCampaignDetailResponse?)->Void) {
            var urlRequest = URLRequest(url: URL(string: serverURLnya)!)
                    urlRequest.httpMethod = "post"
                    urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
                    urlRequest.httpBody = try? JSONEncoder().encode(categoryBody(categories: categories))

            HttpUtility.shared.request(urlRequest, resultType: CreateCampaignDetailResponse.self) { response in
               completionHandler(response)
            }
        }
    func postCreateCampaign(_ postRequest: CreateCampaignDetail, completionHandler:@escaping(_ result: CreateCampaignDetailResponse?)->Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: HttpUtility.endpoint + "campaign/detail/create")! as URL)
        request.httpMethod = "post"
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.httpBody = try? JSONEncoder().encode(postRequest)

        HttpUtility.shared.request(request as URLRequest, resultType: CreateCampaignDetailResponse.self) { response in
            completionHandler(response)
        }
    }
}
