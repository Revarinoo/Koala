//
//  RegisterRequest.swift
//  Koala
//
//  Created by Revarino Putra on 22/10/21.
//  Restructured by Syahrul Fadholi

import Foundation

struct RegisterRequest: Encodable {
    let name: String
    let email: String
    let password: String
    let type_role: String
    let platform_name: String?
    let socialmedia_id: String?
    let engagement_rate: Double?
    let followers: Int?
    let average_likes: Double?
    let average_comments: Double?
}
