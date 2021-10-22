//
//  CategoriesCard.swift
//  Koala
//
//  Created by Sholihatul Richas on 19/10/21.
//

import SwiftUI

struct CategoriesCard: View {
    let image :String
    let category : String
    var body: some View {
        
        VStack(spacing: 6){
            Button(action: {
            }) {
                Image(image).resizable().frame(width: 45, height: 45, alignment: .center)
            }
                .frame(width: 64.0, height: 64.0)
                .background(Color(UIColor(named: "primary")!))
                .cornerRadius(10)
                .shadow(color: .gray, radius: 3, x: 1, y: 2)
            
            Text(category).font(Font.custom(ThemeFont.poppinsMedium, size: 12))
                .foregroundColor(.black)
            
        }
    }
}

struct CategoriesCard_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesCard(image: "coffee", category: "Coffee").previewLayout(.sizeThatFits)
    }
}
