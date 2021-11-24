//
//  OrderDetailView.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 23/11/21.
//

import SwiftUI

struct OrderDetailView: View {
    
    var randNums = (1...100).map{_ in arc4random()}
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            VStack {
                ScrollView {
                    ForEach(randNums, id: \.self) { num in
                        VStack {
                            Text("\(num) %")
                            Divider()
                        }
                    }
                    .border(Color.yellow, width: 3)
                    .background(Color.blue)
                }
                .padding(10)
                .border(Color.red, width: 3)
            }
            
            HStack {
                Text("Footer")
            }
            .background(Color(hex: "F2F2F2"))
        }
    }
}

struct OrderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailView()
    }
}
