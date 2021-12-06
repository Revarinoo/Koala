//
//  PendingCard.swift
//  Koala
//
//  Created by Sholihatul Richas on 28/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct PendingCard: View {
    var pendingOrder: PendingOrder
    @State private var showingAlert = false
    @StateObject private var orderViewModel = OrderViewModel()
    @Binding var deletedAt: Int
    @State var pay: Bool = false
    var body: some View {
        VStack{
            HStack {
                Image("ig")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 25, height: 25)
                ForEach (pendingOrder.productType){ product in
                    Text(product.productType).font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    }
                Spacer()
                Text("12.12 Campaign")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 12))
                    .foregroundColor(Color.init(hex: "A7A7A7"))
            }
            .padding(.horizontal, 15)
            .padding(.bottom, -10)
            .padding(.vertical, 10)
            .padding(.trailing, 2)
            Divider()
            HStack(spacing: 18){
                WebImage(url: URL(string: pendingOrder.photo))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 82, height: 88)
                    .cornerRadius(10)
                VStack (alignment: .leading, spacing: 6){
                    Text(pendingOrder.name).font(Font.custom(ThemeFont.poppinsMedium, size: 18))
                    HStack{
                        Image(systemName: "calendar")
                        
                        Text(pendingOrder.dueDate)
                    }.font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                        .foregroundColor(Color.gray)
                }
                Spacer()
            }.padding([.top, .leading, .trailing], 16).padding(.top, -5)
            HStack{
                Spacer()
                if !pendingOrder.availableToPay {
                    Button(action: {
                        showingAlert.toggle()
                    }){
                        Text("Cancel").font(Font.custom(ThemeFont.poppinsMedium, size: 12))
                            .foregroundColor(ThemeColor.primary)
                            .padding()
                            .padding([.leading, .trailing])
                    }.frame(width: 113, height: 38)
                        .cornerRadius(12)
                        .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(ThemeColor.primary, lineWidth: 1)
                            )
                }
                else {
                    NavigationLink(destination: PaymentView(order_id: pendingOrder.order_id), isActive: $pay) {
                        Button {
                            pay.toggle()
                        } label: {
                            Text("Pay Now")
                                .font(Font.custom(ThemeFont.poppinsMedium, size: 12))
                                .foregroundColor(.white)
                                .padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30))
                                .frame(width: 113, height: 38)
                                .background(ThemeColor.primary)
                                .cornerRadius(12)
                        }
                    }
                    

                }
            }.padding(.bottom, 9).padding(.trailing, 15)
             .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("Cancel Order"),
                        message: Text("Are you sure you want to cancel influencer order?"),
                        primaryButton: .default(Text("No"), action: {
                            
                        }),
                        secondaryButton: .default(Text("Yes").font(Font.custom(ThemeFont.poppinsBold, size: 14)).bold(), action: {
                            
                            DispatchQueue.main.async{
                                orderViewModel.cancelOrder(order_id: pendingOrder.order_id)
                                deletedAt = pendingOrder.index
                            }
                            
                        })
                    )
                }
            
            
        }
        .background(Color.white)
        .cornerRadius(10)
    }
}

//struct PendingCard_Previews: PreviewProvider {
//    static var previews: some View {
//
//        PendingCard(pendingOrder: PendingOrder(id: UUID(),order_id: 1, name: "James Oliver", productType: ["Post"], dueDate: "22 December 2021", photo: "")).previewLayout(.sizeThatFits)
//    }
//}
