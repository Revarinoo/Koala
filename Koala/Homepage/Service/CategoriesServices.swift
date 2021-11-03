//
//  CategoriesServices.swift
//  Koala
//
//  Created by Sholihatul Richas on 20/10/21.
//

import Foundation
import SwiftUI

struct CategoryService {
    @AppStorage("JWT", store: .standard) var token = ""
    
    func getInfluencerList(completionHandler:@escaping(_ result: RecommendationInfluencers?)->Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: HttpUtility.endpoint + "recommended/influencers?categories[]=Coffee")! as URL)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        HttpUtility.shared.request(request as URLRequest, resultType: RecommendationInfluencers.self) { response in
            _ = completionHandler(response)
        }
    }
}
