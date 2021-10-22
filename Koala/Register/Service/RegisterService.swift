//
//  RegisterService.swift
//  Koala
//
//  Created by Revarino Putra on 22/10/21.
//

import Foundation

struct RegisterRequest: Encodable {
    let name: String
    let email: String
    let password: String
    let type_role: String
}

class RegisterService {
    
    func register(_ postRequest: RegisterRequest, completionHandler:@escaping(_ result: AuthResponse?)->Void) {
        guard let url = URL(string: "http://127.0.0.1:8000/api/register") else {
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
