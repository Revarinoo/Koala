//
//  RegisterViewModel.swift
//  Koala
//
//  Created by Revarino Putra on 22/10/21.
//

import Foundation
import SwiftUI

class RegisterViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isAuthenticate = false
    @Published var isPresentingErrorAlert = false
    @Published var errorMessage = ""
    @Published var username = ""
    
    @AppStorage("role", store: .standard) var role = "Influencer"
    @AppStorage("JWT", store: .standard) var token = ""
    
    private let registerService: RegisterService = RegisterService()
    
    func validate() -> Bool {
        if(email.isEmpty || password.isEmpty){
           errorMessage = "User email and password cannot be empty!"
            return false
        }
        if(!isValidEmail(value: email)){
            errorMessage = "Email format is incorrect!"
            return false
        }
        return true
    }
    
    private func isValidEmail(value: String) -> Bool
    {
        let regex = try! NSRegularExpression(pattern: "(^[0-9a-zA-Z]([-\\.\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{2,64}$)", options: .caseInsensitive)
        return regex.firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) != nil
    }
    
    func register() {
        if !validate() { isPresentingErrorAlert.toggle() }
        registerService.register(RegisterRequest(name: name, email: email, password: password, type_role: role, platform_name: "Instagram", socialmedia_id: username, engagement_rate: 32.2, followers: 10000, average_likes: 1000, average_comments: 100)) { response in
            if let code = response?.code, let message = response?.message {
                if code == 201, let access_token = response?.access_token {
                    DispatchQueue.main.async {
                        self.token = access_token
                        self.isAuthenticate = true
                    }
                }
                else {
                    DispatchQueue.main.async {
                        self.isPresentingErrorAlert = true
                        self.errorMessage = message
                    }
                }
            }
        }
    }
}
