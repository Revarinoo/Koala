//
//  RegisterService.swift
//  Koala
//
//  Created by Revarino Putra on 22/10/21.
//

import Foundation

class RegisterService {
    
    func register(_ postRequest: RegisterRequest, completionHandler:@escaping(_ result: AuthResponse?)->Void) {
        guard let url = URL(string: HttpUtility.endpoint +  "register") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(postRequest)

        HttpUtility.shared.request(request, resultType: AuthResponse.self) { response in
            completionHandler(response)
        }
    }
}
