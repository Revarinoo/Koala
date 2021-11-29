//
//  BusinessProfileService.swift
//  Koala
//
//  Created by Clara Anggraini on 27/11/21.
//

import Foundation
import SwiftUI

struct BusinessProfileService {
    @AppStorage("JWT", store: .standard) var token = ""
    func getBusinessProfile(completionHandler:@escaping(_ result: BusinessProfileResponse?)->Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: HttpUtility.endpoint + "business/profile")! as URL)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        HttpUtility.shared.request(request as URLRequest, resultType: BusinessProfileResponse.self) { response in
            _ = completionHandler(response)
        }
    }
}
