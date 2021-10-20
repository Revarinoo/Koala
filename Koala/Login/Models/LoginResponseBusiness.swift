//
//  LoginResponseBusiness.swift
//  Koala
//
//  Created by Jonathan Clive on 20/10/21.
//

import Foundation

struct LoginResponseBusiness: Codable {
    let business: Business
    let token: String
}

struct Business: Codable {
    let id: Int
    let business_name: String
    let website: String
    let isntagram: String
    let user_id: Int
}
