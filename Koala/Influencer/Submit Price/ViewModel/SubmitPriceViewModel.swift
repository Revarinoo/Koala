//
//  SubmitPriceViewModel.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 27/11/21.
//

import Foundation

class SubmitPriceViewModel: ObservableObject {
    
    @Published var price: Int = Int()
    @Published var isSucceed: Bool = false
    private let service = SubmitPriceService()
    
    func submit(id: Int) {
        print("submit price")
        print(id)
        print(price)
        service.submitPrice(SubmitPriceRequest(order_detail_id: id, price: Double(price))) { result in
            if let response = result {
                if response.code == 201 {
                    DispatchQueue.main.async {
                        self.isSucceed = true
                    }
                } else {
                    self.isSucceed = false
                }
            }
        }
    }
}
