//
//  OngoingCardScrollView.swift
//  Koala
//
//  Created by Sholihatul Richas on 28/10/21.
//

import SwiftUI

struct OngoingCardScrollView: View {
    var onGoingOrders : [MyOrders]
    
    var body: some View {
        ScrollView(.vertical){
            VStack{
                ForEach (onGoingOrders){ongoingOrders in
                    OngoingCard(order_id: ongoingOrders.orderID,name: ongoingOrders.name, productType: ongoingOrders.productType, dueDate: ongoingOrders.dueDate, photo: ongoingOrders.photo).padding([.leading,.trailing], 16)
                }
            }
        }
    }
}

//struct OngoingCardScrollView_Previews: PreviewProvider {
//    static var previews: some View {
//        OngoingCardScrollView()
//    }
//}
