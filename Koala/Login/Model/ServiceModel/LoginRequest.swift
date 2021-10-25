//
//  LoginRequest.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 20/10/21.
//

import Foundation

struct LoginRequest: Encodable {
    let email: String
    let password: String
    let type_role: String
}
