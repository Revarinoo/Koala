//
//  AuthResponse.swift
//  Koala
//
//  Created by Revarino Putra on 21/10/21.
//

import Foundation

struct AuthResponse: Codable {
    let code: Int?
    let message: String?
    let access_token: String?
}
