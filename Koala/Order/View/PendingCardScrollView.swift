//
//  PendingCardScrollView.swift
//  Koala
//
//  Created by Sholihatul Richas on 28/10/21.
//

import SwiftUI

struct PendingCardScrollView: View {
    var pendingOrders : [MyOrders]
    
    var body: some View {
        ScrollView(.vertical){
            VStack{
                ForEach (pendingOrders){pendings in
                    PendingCard(name: pendings.name, productType: pendings.productType, dueDate: pendings.dueDate).padding([.leading,.trailing], 16)
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
