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
                    CompletedCard(name: completed.name, productType: "Post", reach: "34K", impression: "3K", engagement: "4.5%").padding([.leading,.trailing], 16)
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
