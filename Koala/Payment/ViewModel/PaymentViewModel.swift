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
    @Published var orderDetail: OrderDetailPaymentModel = OrderDetailPaymentModel()
    
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
    
    func getOrderDetail(orderId: Int) {
        paymentService.getOrderDetail(orderId: orderId) { response in
            if let response = response {
                if response.code == 201 {
                    var detail: [DetailModel] = []
                    for data in response.detail {
                        detail.append(DetailModel(content_type: data.content_type, price: data.price))
                    }
                    
                    DispatchQueue.main.async {
                        self.orderDetail = OrderDetailPaymentModel(campaign_name: response.campaign_name, time_period: response.time_period, detail: detail, influencer: response.influencer)
                        print(self.orderDetail)
                    }
                }
            }
        }
    }
    
}
