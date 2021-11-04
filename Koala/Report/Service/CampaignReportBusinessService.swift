//
//  CampaignReportBusinessService.swift
//  Koala
//
//  Created by Jonathan Clive on 03/11/21.
//

import Foundation
import SwiftUI

struct CampaignReportBusinessService {
    @AppStorage("JWT", store: .standard) var token = ""
    func getCampaignReportBusiness(_ contentID: Int, completionHandler:@escaping(_ result: CampaignReportBusinessResponse?)->Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: HttpUtility.endpoint + "business-report/\(contentID)")! as URL)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        HttpUtility.shared.request(request as URLRequest, resultType: CampaignReportBusinessResponse.self) { response in
            _ = completionHandler(response)
        }
    }
}

