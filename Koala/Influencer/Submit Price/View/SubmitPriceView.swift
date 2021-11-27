//
//  SubmitPriceView.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 27/11/21.
//

import SwiftUI

struct SubmitPriceView: View {
    
    @Binding var isModalPresented: Bool
    @StateObject var priceVM = SubmitPriceViewModel()
    @StateObject var campaignVM = InfluencerCampaignDetailViewModel()
    
    var serviceType: String
    var orderDetailId: Int
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
                Text(serviceType)
                    .font(.custom(ThemeFont.poppinsSemiBold, size: 18))
                    .foregroundColor(.black)
                    .padding(.bottom, 5)
                    .padding(.top, 20)
                Text("Price")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(ThemeColor.grayDark)
                TextField("Enter price", value: $priceVM.price, formatter: NumberFormatter.currency)
                    .keyboardType(.numberPad)
                    .textFieldStyle(OvalTextFieldStyleForm())
                    .padding(.bottom, 3)
                Spacer()
            }
            .padding(.horizontal, 16)
            .navigationTitle("Input Price")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        self.isModalPresented = false
                    }.foregroundColor(ThemeColor.primary)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        priceVM.submit(id: orderDetailId)
                    } label: {
                        Text("Submit")
                            .foregroundColor(ThemeColor.primary)
                    }
                    .alert(isPresented: $priceVM.isSucceed) {
                        Alert(title: Text("Success"), message: Text("Price successfully updated"), dismissButton: .cancel(Text("Ok"), action: {
                            self.isModalPresented = false
                        }))
                    }
                }
            }
        }
    }
}
