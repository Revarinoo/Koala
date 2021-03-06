//
//  CategoriesCard.swift
//  Koala
//
//  Created by Sholihatul Richas on 19/10/21.
//  Modified by Syahrul Fadholi (Navigation)

import SwiftUI

struct CategoriesCard: View {
    
    let image :String
    let category : String
    
    @State var gotoInfluencerList: Bool = false
    
    var body: some View {
        
        VStack(spacing: 6) {
            NavigationLink(
                destination:
                    InfluencerListView(showBackButton: true, categorySelected: category).navigationBarTitle("")
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true),
                isActive: $gotoInfluencerList,
                label: {
                    Button(action: {
                        gotoInfluencerList.toggle()
                    }) {
                        Image(image).resizable().aspectRatio(contentMode: .fit)
                            .frame( maxWidth: 34, maxHeight: 34, alignment: .center)
                    }
                        .frame(width: 64.0, height: 64.0)
                            .background(Color(UIColor(named: "primary")!))
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 3, x: 1, y: 2)
                })

            
            
            Text(category).font(Font.custom(ThemeFont.poppinsMedium, size: 12))
                .foregroundColor(.black)
            
        }
    }
}

struct CategoriesCard_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesCard(image: "drinks", category: "Coffee").previewLayout(.sizeThatFits)
    }
}
