//
//  RecommendationInfluencerService.swift
//  Koala
//
//  Created by Sholihatul Richas & Revarino Putra on 20/10/21.
//

import Foundation

let categoriesDefault = UserDefaults.standard

struct RecommendationInfluencerService {
    
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
