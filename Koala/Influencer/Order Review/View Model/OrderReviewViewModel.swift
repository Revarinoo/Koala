//
//  OrderReviewViewModel.swift
//  Koala
//
//  Created by Revarino Putra on 25/11/21.
//

import Foundation

class OrderReviewViewModel: ObservableObject {
    @Published var data: OrderReviewResponse = OrderReviewResponse(code: 0, message: "", review: ReviewData(comment: "", rating: 0), business: BusinessData(photo: "", name: ""))
    private let service = OrderReviewService()
    
    
    func getReview(orderId: Int) {
        print("HELLO")
        service.getOrderReview(orderId: orderId) { result in
            if let response = result {
                if response.code == 201 {
                    DispatchQueue.main.async {
                        self.data = OrderReviewResponse(code: response.code, message: response.message, review: response.review, business: response.business)
                    }
                }
            }
        }
    }
}
