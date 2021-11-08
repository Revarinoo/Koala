//
//  UserProfile.swift
//  Koala
//
//  Created by Sholihatul Richas on 01/11/21.
//

import Foundation

struct UserProfile: Codable{
    var name: String
    var photo: String
    var location: String
}

struct UserProfileData {
    var name: String
    var photo: String
    var location: String
}
