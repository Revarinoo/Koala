//
//  UserProfileService.swift
//  Koala
//
//  Created by Sholihatul Richas on 01/11/21.
//

import Foundation
import SwiftUI

struct UserProfileService {
    @AppStorage("JWT", store: .standard) var token = ""
    func getUserProfile(completionHandler:@escaping(_ result: UserProfile?)->Void){
        let request = NSMutableURLRequest(url: NSURL(string:  "http://127.0.0.1:8000/api/user")! as URL)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
       
               HttpUtility.shared.request(request as URLRequest, resultType: UserProfile.self) { response in
                   _ = completionHandler(response)
               }
    }
}
