//
//  CampaignDetailService.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 02/11/21.
//

import Foundation
import SwiftUI

struct CampaignDetailService {
    @AppStorage("JWT", store: .standard) var token = ""
    func getCampaignDetail(_ id: Int, completionHandler:@escaping(_ result: CampaignDetailResponse?)->Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: HttpUtility.endpoint + "campaign/detail/\(id)")! as URL)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        HttpUtility.shared.request(request as URLRequest, resultType: CampaignDetailResponse.self) { response in
            _ = completionHandler(response)
        }
    }
}
