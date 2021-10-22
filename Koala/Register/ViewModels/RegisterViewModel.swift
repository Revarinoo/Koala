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
    @Published var passwordConfirm: String = ""
    @Published var isAuthenticate = false
    
    @AppStorage("role", store: .standard) var role = "Business"
    @AppStorage("JWT", store: .standard) var token = ""
    
    private let registerService: RegisterService = RegisterService()
    
    func register() {
        registerService.register(RegisterRequest(name: name, email: email, password: password, type_role: role)) { response in
            if let code = response?.code, let message = response?.message {
                if code == 201, let access_token = response?.access_token {
                    DispatchQueue.main.async {
                        self.token = access_token
                        self.isAuthenticate = true
                    }
                }
            }
        }
    }
}
