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
                ForEach (completedOrders){completed in
                    CompletedCard(name: completed.name, reach: completed.avgReach, impression: completed.avgImpression, engagement: String(completed.avgER.rounded(toPlaces: 1))+"%", photo: completed.photo, orderId: completed.orderID).padding([.leading,.trailing], 16)
                }
            }
            Spacer()
        }
    }
}

//struct CompletedCardScrollView_Previews: PreviewProvider {
//    static var previews: some View {
//        CompletedCardScrollView()
//    }
//}
