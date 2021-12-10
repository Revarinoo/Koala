//
//  InstaMediaModel.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 28/11/21.
//

import Foundation

struct InstaMediaModel: Codable {
    let data: InstaMediaData
}

struct InstaMediaData: Codable {
    let images: InstaImageData
}

struct InstaImageData: Codable {
    let thumbnail: String
}
