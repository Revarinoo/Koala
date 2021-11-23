//
//  LoginViewModel.swift
//  Koala
//
//  Created by Revarino Putra on 11/10/21.
//  Edited by Syahrul Fadholi

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    
    @Published var loginModel: LoginModel = LoginModel()
    private let loginService: LoginService = LoginService()
    private let loginValidation = LoginValidation()
    
    @AppStorage("role", store: .standard) var role = "Influencer"
    @AppStorage("JWT", store: .standard) var token = ""
    
    func validateUserInputs() -> Bool {

        let result = loginValidation.validateUserInputs(userEmail: loginModel.email, userPassword: loginModel.password)
        if (result.success == false) {
            loginModel.errorMessage = result.errorMessage ?? "error occured"
            loginModel.isPresentingErrorAlert = true
            
            return false
        }

        return true
    }

    func login() {
        
        let loginRequest = LoginRequest(email: loginModel.email, password: loginModel.password, type_role: role)
        loginService.login(loginRequest) { response in
            DispatchQueue.main.async {
                if let code = response?.code, let message = response?.message {
                    if code == 201, let token = response?.access_token {
                        self.loginModel.navigate = true
                        self.token = token
                    }
                    else {
                        self.loginModel.errorMessage = message
                        self.loginModel.isPresentingErrorAlert = true
                    }
                }
            }
        }
    }
}
