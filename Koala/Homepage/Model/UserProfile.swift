//
//  UserProfile.swift
//  Koala
//
//  Created by Sholihatul Richas on 01/11/21.
//

import Foundation

struct UserProfile: Codable{
    var id: Int
    var name: String
    var photo: String
}

struct UserProfileData {
    var id: Int
    var name: String
    var photo: String
}
