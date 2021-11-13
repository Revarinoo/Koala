//
//  BusinessReportService.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 12/11/21.
//

import Foundation
import SwiftUI

struct BusinessReportService {
    @AppStorage("JWT", store: .standard) var token = ""
    
    func getReport(completionHandler:@escaping(_ result: BusinessReportResponse?)->Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: HttpUtility.endpoint + "business-report")! as URL)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        HttpUtility.shared.request(request as URLRequest, resultType: BusinessReportResponse.self) { response in
            _ = completionHandler(response)
        }
    }
}
