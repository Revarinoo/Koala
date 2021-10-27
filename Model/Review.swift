//
//  Review.swift
//  Koala
//
//  Created by Jonathan Clive on 25/10/21.
//

import Foundation

struct Review: Identifiable{
    let id = UUID()
    var userImage: String
    var name: String
    var message: String
    var rating: Int
}
