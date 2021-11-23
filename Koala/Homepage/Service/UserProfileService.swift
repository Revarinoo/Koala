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
        let request = NSMutableURLRequest(url: NSURL(string:  HttpUtility.endpoint + "user")! as URL)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
       
               HttpUtility.shared.request(request as URLRequest, resultType: UserProfile.self) { response in
                   _ = completionHandler(response)
               }
    }
    
    func getSpecificUserProfile(userId: Int, completionHandler:@escaping(_ result: UserProfile?)->Void){
        let request = NSMutableURLRequest(url: NSURL(string:  HttpUtility.endpoint + "user/\(userId)")! as URL)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
       
               HttpUtility.shared.request(request as URLRequest, resultType: UserProfile.self) { response in
                   _ = completionHandler(response)
               }
    }
}
