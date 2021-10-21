//
//  LoginResponseBusiness.swift
//  Koala
//
//  Created by Jonathan Clive on 20/10/21.
//  Edited by Syahrul Fadholi

import Foundation

struct LoginResponseBusiness: Decodable {
    let business: Business
    let token: String
}

struct Business: Decodable {
    let id: Int
    let business_name: String?
    let website: String?
    let instagram: String?
    let user_id: Int
}
