//
//  PaymentView.swift
//  Koala
//
//  Created by Clara Anggraini on 24/11/21.
//

import Foundation
import SwiftUI

struct PaymentView: View {
    @ObservedObject var paymentViewModel = PaymentViewModel()
    @ObservedObject var campaignViewModel = CampaignViewModel()
    
    @State var showWebView = false
    @State var payment_url = ""
    @State var payment_status = ""
    var order_id = 26
    
    var body: some View {
        ZStack {
            VStack{
                Button(action: {
                    guard let paymentProcess = paymentViewModel.paymentProcess else {return}
                    payment_url = paymentProcess.payment_url
                    print(paymentProcess.payment_url)
                    showWebView.toggle()
                }){
                    Text("Proceed to Payment")
                }
                Text(paymentViewModel.paymentProcess?.payment_status ?? "NIL")
            }
        }.sheet(isPresented: $showWebView){
            
//            PaymentProcessView(showWebView: $showWebView, payment_url: $payment_url)
        
        }.onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            
            paymentViewModel.getOrderPayment(order_id: order_id)
        
        }.onReceive(paymentViewModel.$paymentProcess, perform: { payment in
            
            guard let unwrapped_payment = payment else {return}
            
            payment_url = unwrapped_payment.payment_url
            payment_status = unwrapped_payment.payment_status
            
            if payment_status == "paid"{
                showWebView = false
            }
            
          }).onAppear{
            paymentViewModel.getOrderPayment(order_id: order_id)
        }
    }
}
