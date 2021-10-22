//
//  CategoriesServices.swift
//  Koala
//
//  Created by Sholihatul Richas on 20/10/21.
//

import Foundation

struct CategoryService {
    
    func getInfluencerList(completionHandler:@escaping(_ result: RecommendationInfluencers?)->Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: HttpUtility.endpoint + "recommended/influencers?categories[]=Coffee")! as URL)
        request.allHTTPHeaderFields = HttpUtility.shared.headers

        HttpUtility.shared.request(request as URLRequest, resultType: RecommendationInfluencers.self) { response in
            _ = completionHandler(response)
        }
    }
}
