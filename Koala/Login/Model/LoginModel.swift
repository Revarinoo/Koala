//
//  LoginModel.swift
//  Koala
//
//  Created by Jonathan Clive on 20/10/21.
//  Edited by Syahrul Fadholi

import Foundation

struct LoginModel {
    var email: String = String()
    var password: String = String()
    var errorMessage: String = String()
    var navigate: Bool = false
    var isPresentingErrorAlert: Bool = false
}
