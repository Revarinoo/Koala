//
//  InfluencerDetailService.swift
//  Koala
//
//  Created by Clara Anggraini on 25/10/21.
//

import Foundation
import SwiftUI

struct InfluencerDetailService {
    @AppStorage("JWT", store: .standard) var token = ""
    func getInfluencerDetail(_ influencerID: Int, completionHandler:@escaping(_ result: InfluencerDetailResponse?)->Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: HttpUtility.endpoint + "influencer/\(influencerID)")! as URL)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        HttpUtility.shared.request(request as URLRequest, resultType: InfluencerDetailResponse.self) { response in
            _ = completionHandler(response)
            
        }
    }
}
