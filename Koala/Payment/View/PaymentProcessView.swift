//
//  PaymentProcessView.swift
//  Koala
//
//  Created by Clara Anggraini on 23/11/21.
//

import Foundation
import SwiftUI

struct PaymentProcessView: View {
    @ObservedObject var webViewModel = WebViewModel()
    @ObservedObject var campaignViewModel = CampaignViewModel()
    
    @State var showLoader = false
    @Binding var showWebView: Bool
    @Binding var payment_url: String
    
    var body: some View {
        ZStack {
            
            VStack(spacing: 0) {
                
                WebView(payment_url: payment_url+"#/select-payment", viewModel: webViewModel)
            }
            .onReceive(self.webViewModel.showLoader.receive(on: RunLoop.main)) { value in
                self.showLoader = value
            }
            
            if showLoader {
                Loader()
            }
        }
    }
}

