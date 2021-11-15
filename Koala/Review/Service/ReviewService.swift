//
//  ReviewService.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 28/10/21.
//

import Foundation

struct ReviewService {
    
    func sendReview(_ postRequest: ReviewRequest, completionHandler:@escaping(_ result: ReviewResponse?)->Void) {
        
<<<<<<< HEAD
        let request = NSMutableURLRequest(url: NSURL(string: "http://127.0.0.1:8000/api/order/review")! as URL)
=======
        let request = NSMutableURLRequest(url: NSURL(string: HttpUtility.endpoint + "order/review")! as URL)
>>>>>>> b28d938d90a1a6ed141eebde3c5a212283cf6859
        request.httpMethod = "post"
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.httpBody = try? JSONEncoder().encode(postRequest)

        HttpUtility.shared.request(request as URLRequest, resultType: ReviewResponse.self) { response in
            completionHandler(response)
        }
    }
}
