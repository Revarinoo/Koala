//
//  CategoriesCard.swift
//  Koala
//
//  Created by Sholihatul Richas on 19/10/21.
//

import SwiftUI

struct CategoriesCard: View {
    var body: some View {
        VStack(spacing: 6){
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image("ph_coffee").resizable().frame(width: 45, height: 45, alignment: .center)
            }
                .frame(width: 64.0, height: 64.0)
                .background(Color(UIColor(named: "primary")!))
                .cornerRadius(10)
                .shadow(color: .gray, radius: 3, x: 1, y: 2)
            
            /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            
        }
    }
}

struct CategoriesCard_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesCard().previewLayout(.sizeThatFits)
    }
}
