//
//  RecommendationInfluencerService.swift
//  Koala
//
//  Created by Sholihatul Richas & Revarino Putra on 20/10/21.
//

import Foundation

struct RecommendationInfluencerService {
    
    func getInfluencerList(completionHandler:@escaping(_ result: RecommendationInfluencers?)->Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: HttpUtility.endpoint + "recommended/influencers?categories[]=Coffee")! as URL)
        request.allHTTPHeaderFields = HttpUtility.shared.headers

        HttpUtility.shared.request(request as URLRequest, resultType: RecommendationInfluencers.self) { response in
            _ = completionHandler(response)
        }
    }
    
    func getRecomended(categories: [String], completionHandler:@escaping(_ result: RecommendationInfluencers?)->Void) {
            var urlRequest = URLRequest(url: URL(string: HttpUtility.endpoint + "recommended/influencers")!)
                    urlRequest.httpMethod = "post"
                    urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
                    urlRequest.httpBody = try? JSONEncoder().encode(categoryBody(categories: categories))

            HttpUtility.shared.request(urlRequest, resultType: RecommendationInfluencers.self) { response in
               completionHandler(response)
            }
        }
}
