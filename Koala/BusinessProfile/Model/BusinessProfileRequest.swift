//
//  BusinessProfileRequest.swift
//  Koala
//
//  Created by Clara Anggraini on 27/11/21.
//

import Foundation

struct BusinessProfileRequest: Encodable{
    let business_photo: String?
    let business_name: String?
    let instagram: String?
    let location: String?
    let website: String?
    let description: String?
}
