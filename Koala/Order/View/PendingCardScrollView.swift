//
//  PendingCardScrollView.swift
//  Koala
//
//  Created by Sholihatul Richas on 28/10/21.
//

import SwiftUI

struct PendingCardScrollView: View {
    var pendingOrders : [MyOrders]
    @State var deletedAt: Int = -1
    var body: some View {
        ScrollView(.vertical){
            VStack{
                ForEach (pendingOrders){pendings in
                    PendingCard(pendingOrder: PendingOrder(id:pendings.id , order_id: pendings.orderID, name: pendings.name, productType: pendings.productType, dueDate: pendings.dueDate, photo: pendings.photo)).padding([.leading,.trailing], 16)

                }
            }
            Spacer()
        }
    }
}

//struct PendingCardScrollView_Previews: PreviewProvider {
//    static var previews: some View {
//        PendingCardScrollView()
//    }
//}
