//
//  LoginViewModel.swift
//  Koala
//
//  Created by Revarino Putra on 11/10/21.
//  Edited by Syahrul Fadholi

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var loginModel: LoginModel = LoginModel()
    private let loginService: LoginService = LoginService()
    private let loginValidation = LoginValidation()
    
    func validateUserInputs() -> Bool {

        let result = loginValidation.validateUserInputs(userEmail: loginModel.email, userPassword: loginModel.password)
        if (result.success == false) {
            loginModel.errorMessage = result.errorMessage ?? "error occured"
            loginModel.isPresentingErrorAlert = true
            
            return false
        }

        return true
    }

    func callLoginInfluencer() {
        
        let loginRequest = LoginRequest(email: loginModel.email, password: loginModel.password, type_role: "Influencer")
        loginService.loginInfluencer(loginRequest) { response in
            DispatchQueue.main.async {
                if let token = response?.token {
                    print(token)
                    self.loginModel.navigate = true
                } else {
                    self.loginModel.errorMessage = "The provided credentials do not match our records."
                    self.loginModel.isPresentingErrorAlert = true
                }
            }
        }
    }
}
