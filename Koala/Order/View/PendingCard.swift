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
    
    var body: some View {
        VStack{
            HStack(spacing: 18){
                WebImage(url: URL(string: pendingOrder.photo))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 82, height: 88)
                    .cornerRadius(10)
                VStack (alignment: .leading, spacing: 6){
                    HStack (spacing: 9){
                        ForEach (pendingOrder.productType, id: \.self){
                            product in Text(product).scaledToFill()
                                .font(Font.custom(ThemeFont.poppinsMedium, size: 12))
                                .padding(.horizontal, 10)
                                .padding(.vertical, 2)
                                .foregroundColor(ThemeColor.primary)
                                .frame(minWidth: 71, minHeight: 20, alignment: .center)
                                .background(ThemeColor.primaryLight)
                                .cornerRadius(5)
                        }

                    }
                    Text(pendingOrder.name).font(Font.custom(ThemeFont.poppinsMedium, size: 18))
                    HStack{
                        Image(systemName: "calendar")
                        
                        Text(pendingOrder.dueDate)
                    }.font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                        .foregroundColor(Color.gray)
                }
                Spacer()
            }.padding([.top, .leading, .trailing], 16)
            HStack{
                Spacer()
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
                                
                            }
                            
                        })
                    )
                }
            
            
        }
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct PendingCard_Previews: PreviewProvider {
    static var previews: some View {
        
        PendingCard(pendingOrder: PendingOrder(id: UUID(),order_id: 1, name: "James Oliver", productType: ["Post"], dueDate: "22 December 2021", photo: "")).previewLayout(.sizeThatFits)
    }
}
