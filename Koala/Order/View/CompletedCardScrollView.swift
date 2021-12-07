//
//  CompletedCardScrollView.swift
//  Koala
//
//  Created by Sholihatul Richas on 28/10/21.
//

import SwiftUI

struct CompletedCardScrollView: View {
    var completedOrders : [MyOrders]
    var body: some View {
        ScrollView(.vertical){
            VStack{
                ForEach (completedOrders){ completed in
                    ForEach (completed.productType) { product in
                        CompletedCard(type: product.productType, name: completed.name, data1: numberPrint(number: product.data1), data2: numberPrint(number: product.data2), engagement: String(product.er.rounded(toPlaces: 1))+"%", photo: completed.photo, orderId: completed.orderID).padding(.horizontal, 16)
                    }
                }
            }
            Spacer()
        }
    }
    
    private func numberPrint(number: Int) -> String {
        var numberString = ""
        if number == 0 {
            numberString = "N/A"
        } else if number < 1000 {
            numberString = "\(number)"
        } else {
            let numberDivided = Double(number)/1000
            numberString = "\(String(format: "%.1f", numberDivided))K"
        }
        return numberString
    }
}

//struct CompletedCardScrollView_Previews: PreviewProvider {
//    static var previews: some View {
//        CompletedCardScrollView()
//    }
//}

