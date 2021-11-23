//
//  PaymentViewModel.swift
//  Koala
//
//  Created by Clara Anggraini on 23/11/21.
//

import Foundation
import Combine

class WebViewModel: ObservableObject {
    var webViewNavigationPublisher = PassthroughSubject<WebViewNavigation, Never>()
    var showWebTitle = PassthroughSubject<String, Never>()
    var showLoader = PassthroughSubject<Bool, Never>()
    var valuePublisher = PassthroughSubject<String, Never>()
}

// For identifiying WebView's forward and backward navigation
enum WebViewNavigation {
    case backward, forward, reload
}

class PaymentViewModel: ObservableObject{
    
    private let paymentService: PaymentService = PaymentService()
    @Published var paymentProcess: PaymentProcess?
    
    func getOrderURL(order_id: Int){
       
        var payment: PaymentProcess?
        paymentService.getPaymentProcess(order_id: order_id){ response in
            if let response = response{
                if response.code == 201{
                    payment = PaymentProcess(order_id: response.order_id, token: response.token, payment_url: response.payment_url)
                }
            }
        }
        guard let payment = payment else {
            return
        }

        DispatchQueue.main.async {
            self.paymentProcess = payment
        }
    }
}
