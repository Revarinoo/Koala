//
//  BusinessProfileModel.swift
//  Koala
//
//  Created by Clara Anggraini on 27/11/21.
//

import Foundation
import UIKit

struct InputBusinessProfileModel{
    var business_photo:  UIImage = UIImage()
    var business_name: String?
    var instagram: String?
    var location: locationProvince = .defaultValue
    var website: String?
    var description: String?
}

struct BusinessProfileModel{
    var business_photo:  String?
    var business_name: String?
    var instagram: String?
    var location: String?
    var website: String?
    var description: String?
}
