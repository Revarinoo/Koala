//
//  PaymentView.swift
//  Koala
//
//  Created by Clara Anggraini on 24/11/21.
//

import Foundation
import SwiftUI
import Introspect

struct PaymentView: View {
    @StateObject var paymentViewModel = PaymentViewModel()
    @ObservedObject var campaignViewModel = CampaignViewModel()
    @State var uiTabarController: UITabBarController?
    @StateObject var tabBarVM = TabBarViewModel.shared
    @State var paymentDone = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var showWebView = false
    @State var payment_url = ""
    @State var payment_status = ""
    var order_id: Int
    
    var body: some View {
        ZStack {
            ZStack {
                VStack {
                    PaymentOrderDetail(paymentVM: paymentViewModel)
                    Spacer()
                }
                
                VStack {
                    Spacer()
                    VStack (spacing: 14) {
                        Divider()
                        HStack {
                            Text("Total Payment")
                                .font(.custom(ThemeFont.poppinsMedium, size: 18))
                                .foregroundColor(.black)
                            Spacer()
                            Text(totalPayment(detailModel: paymentViewModel.orderDetail.detail))
                                .font(.custom(ThemeFont.poppinsMedium, size: 20))
                        }
                        .padding([.leading, .trailing], 16)
                        
                        Button(action: {
                            guard let paymentProcess = paymentViewModel.paymentProcess else {return}
                            payment_url = paymentProcess.payment_url
                            print(paymentProcess.payment_url)
                            showWebView.toggle()
                        }){
                            Text("Choose Payment Method")
                                .font(.custom(ThemeFont.poppinsSemiBold, size: 18))
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 11, leading: 62, bottom: 12, trailing: 61))
                                .frame(width: 358, height: 50)
                                .background(ThemeColor.primary)
                                .cornerRadius(15)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width, height: 120)
                    .padding(.bottom, 35)
                }
                .edgesIgnoringSafeArea(.bottom)
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
                presentationMode.wrappedValue.dismiss()
                paymentDone.toggle()
                tabBarVM.selectedTab = 2
            }
            
          }).onAppear{
            paymentViewModel.getOrderPayment(order_id: order_id)
              paymentViewModel.getOrderDetail(orderId: order_id)
        }
          .navigate(to: TabBar(selectedTab: $tabBarVM.selectedTab), when: $paymentDone)
          .introspectTabBarController { (UITabBarController) in
                                  UITabBarController.tabBar.isHidden = true
                                  uiTabarController = UITabBarController
                              }.onDisappear{
                                  uiTabarController?.tabBar.isHidden = false
                              }
          .navigationBarTitle("Review", displayMode: .inline)
    }
    
    private func totalPayment(detailModel: [DetailModel]) -> String {
        var total: Double = 0.0
        for detail in detailModel {
            total += detail.price
        }
        return "Rp \(Int(total).rupiahFormatter())"
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView(order_id: 10)
    }
}
