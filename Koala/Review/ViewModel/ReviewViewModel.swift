//
//  ReviewViewModel.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 28/10/21.
//

import Foundation

class ReviewViewModel: ObservableObject {
    
    @Published var reviewModel: ReviewModel = ReviewModel()
    private let reviewService: ReviewService = ReviewService()
    
    func submitReview() {
        reviewService.sendReview(reviewModel) { }
    }
}
