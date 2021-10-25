//
//  LoginService.swift
//  Koala
//
//  Created by Revarino Putra on 11/10/21.
//  Edited by Jonathan Clive & Syahrul Fadholi

import Foundation

struct LoginService {
    
    func login(_ postRequest: LoginRequest, completionHandler:@escaping(_ result: AuthResponse?)->Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://127.0.0.1:8000/api/login")! as URL)
        request.httpMethod = "post"
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.httpBody = try? JSONEncoder().encode(postRequest)

        HttpUtility.shared.request(request as URLRequest, resultType: AuthResponse.self) { response in
            completionHandler(response)
        }
    }
}
