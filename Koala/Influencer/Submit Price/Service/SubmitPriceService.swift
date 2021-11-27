//
//  SubmitPriceService.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 27/11/21.
//

import Foundation

class SubmitPriceService {
    
    func submitPrice(_ requestBody: SubmitPriceRequest, completionHandler: @escaping(_ result: SubmitPriceResponse?) -> Void) {
        let request = NSMutableURLRequest(url: NSURL(string: HttpUtility.endpoint + "order/detail/price")! as URL)
        request.httpMethod = "post"
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.httpBody = try? JSONEncoder().encode(requestBody)

        HttpUtility.shared.request(request as URLRequest, resultType: SubmitPriceResponse.self) { response in
            completionHandler(response)
        }
    }
}
