//
//  ReviewModel.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 28/10/21.
//

import Foundation

struct ReviewModel {
    var comment: String = ""
    var rating: Int = 0
    var errorMessage: String = String()
    var navigate: Bool = false
    var isPresentingErrorAlert: Bool = false
}
