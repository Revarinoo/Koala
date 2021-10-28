//
//  ReviewService.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 28/10/21.
//

import Foundation

struct ReviewService {
    
    func sendReview(_ postRequest: ReviewRequest, completionHandler:@escaping(_ result: ReviewResponse?)->Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://127.0.0.1:8000/api/order/review")! as URL)
        request.httpMethod = "post"
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.httpBody = try? JSONEncoder().encode(postRequest)

        HttpUtility.shared.request(request as URLRequest, resultType: ReviewResponse.self) { response in
            completionHandler(response)
        }
    }
}
