//
//  SubmitReportService.swift
//  Koala
//
//  Created by Revarino Putra on 25/11/21.
//

import Foundation

class SubmitReportService {
    
    func submitReport(requestBody: ReportRequest, completionHandler: @escaping(_ result: ReportResponse?) -> Void) {
        let request = NSMutableURLRequest(url: NSURL(string: HttpUtility.endpoint + "influencer/order/report")! as URL)
        request.httpMethod = "post"
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.httpBody = try? JSONEncoder().encode(requestBody)

        HttpUtility.shared.request(request as URLRequest, resultType: ReportResponse.self) { response in
            completionHandler(response)
        }
    }
}
