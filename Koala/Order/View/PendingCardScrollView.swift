//
//  PendingCardScrollView.swift
//  Koala
//
//  Created by Sholihatul Richas on 28/10/21.
//

import SwiftUI

struct PendingCardScrollView: View {
    @ObservedObject var orderVM: OrderViewModel
    @State var deletedAt: Int = -1
    var body: some View {
        ScrollView(.vertical){
            VStack{
                ForEach (orderVM.pendingOrders.indices, id: \.self){i in
                    PendingCard(pendingOrder: PendingOrder(id: orderVM.pendingOrders[i].id, index: i , order_id: orderVM.pendingOrders[i].orderID, name: orderVM.pendingOrders[i].name, productType: orderVM.pendingOrders[i].productType, dueDate: orderVM.pendingOrders[i].dueDate, photo: orderVM.pendingOrders[i].photo, availableToPay: orderVM.pendingOrders[i].availableToPay), deletedAt: $deletedAt).padding([.leading,.trailing], 16)
                }
            }
            Spacer()
        }.onChange(of: deletedAt, perform: { _ in
            orderVM.pendingOrders.remove(at: deletedAt)
        })
    }
}

//struct PendingCardScrollView_Previews: PreviewProvider {
//    static var previews: some View {
//        PendingCardScrollView()
//    }
//}
