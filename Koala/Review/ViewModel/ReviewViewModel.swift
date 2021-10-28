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
    private let reviewValidation = ReviewValidation()
    
    func validateUserReview() -> Bool {

        let result = reviewValidation.validateUserInputs(rating: reviewModel.rating, comment: reviewModel.comment)
        if (result.success == false) {
            reviewModel.errorMessage = result.errorMessage ?? "error occured"
            reviewModel.isPresentingErrorAlert = true
            
            return false
        }

        return true
    }
    
    func submitReview(orderId: Int) {
        
        let reviewRequest = ReviewRequest(order_id: orderId, comment: reviewModel.comment, rating: reviewModel.rating)
        reviewService.sendReview(reviewRequest) { response in
            DispatchQueue.main.async {
                if let code = response?.code, let message = response?.message {
                    if code == 201 {
                        self.reviewModel.navigate = true
                    }
                    else {
                        self.reviewModel.errorMessage = message
                        self.reviewModel.isPresentingErrorAlert = true
                    }
                }
            }
        }
    }
}
