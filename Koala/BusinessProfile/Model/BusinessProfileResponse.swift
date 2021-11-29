//
//  BusinessProfileResponse.swift
//  Koala
//
//  Created by Clara Anggraini on 28/11/21.
//

import Foundation

struct BusinessProfileResponse: Decodable{
    let business_photo: String?
    let business_name: String?
    let instagram: String?
    let location: String?
    let website: String?
    let description: String?
    let message: String
    let code: Int
}
