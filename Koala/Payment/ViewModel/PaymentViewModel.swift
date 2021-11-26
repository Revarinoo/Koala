//
//  PaymentViewModel.swift
//  Koala
//
//  Created by Clara Anggraini on 23/11/21.
//

import Foundation
import Combine
import SwiftUI

class WebViewModel: ObservableObject {
    var showWebTitle = PassthroughSubject<String, Never>()
    var showLoader = PassthroughSubject<Bool, Never>()
    var valuePublisher = PassthroughSubject<String, Never>()
}

class PaymentViewModel: ObservableObject{
    
    private let paymentService: PaymentService = PaymentService()
    @Published var paymentProcess: PaymentProcess?
    
    func getOrderPayment(order_id: Int){
       
        var payment: PaymentProcess?
        paymentService.getPaymentProcess(order_id: order_id){ response in
            if let response = response{
                if response.code == 201{
                    payment = PaymentProcess(order_id: response.order_id, token: response.token, payment_url: response.payment_url, payment_status: response.payment_status)
                }
            }
            guard let unwrappedPayment = payment else {
                return
            }

            DispatchQueue.main.async {
                self.paymentProcess = unwrappedPayment
            }
        }
    }
}
