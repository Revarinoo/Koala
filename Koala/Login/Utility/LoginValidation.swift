//
//  LoginValidation.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 20/10/21.
//

import Foundation

struct ValidationResult {
    var success: Bool = false
    var errorMessage: String?
}

struct LoginValidation {

    func validateUserInputs(userEmail: String , userPassword: String) -> ValidationResult {

        if(userEmail.isEmpty || userPassword.isEmpty){
            return ValidationResult(success: false, errorMessage: "User email and password cannot be empty")
        }
        if(isValidEmail(value: userEmail) == false){
            return ValidationResult(success: false, errorMessage: "User email format is incorrect")
        }

        return ValidationResult(success: true, errorMessage: nil)
    }

    private func isValidEmail(value: String) -> Bool
    {
        let regex = try! NSRegularExpression(pattern: "(^[0-9a-zA-Z]([-\\.\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{2,64}$)", options: .caseInsensitive)
        return regex.firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) != nil
    }
}
