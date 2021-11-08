//
//  ReviewValidation.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 29/10/21.
//

import Foundation

struct ReviewValidationResult {
    var success: Bool = false
    var errorMessage: String?
}

struct ReviewValidation {

    func validateUserInputs(rating: Int , comment: String) -> ReviewValidationResult {

        if (rating == 0) {
            return ReviewValidationResult(success: false, errorMessage: "Rating star cannot be 0")
        }
        if (comment.isEmpty) {
            return ReviewValidationResult(success: false, errorMessage: "Comment cannot be empty")
        }

        return ReviewValidationResult(success: true, errorMessage: nil)
    }
}
