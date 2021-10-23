//
//  Categories.swift
//  Koala
//
//  Created by Sholihatul Richas on 19/10/21.
//

import Foundation

struct Categories: Identifiable{
    let id = UUID()
    var categoryName: String
    var categoryImage: String
}

struct categoryBody: Codable {
    let categories: [String]
}



