//
//  HomepageCategories.swift
//  Koala
//
//  Created by Sholihatul Richas on 19/10/21.
//

import SwiftUI

struct HomepageCategoriesCard: View {
    let categories = CategoryViewModel().categories
    
    var body: some View {
        ScrollView(.horizontal){
            HStack(spacing:24){
                ForEach(categories){ i in
                    CategoriesCard(image: i.categoryImage, category: i.categoryName)
                }
            }.padding(.leading,16).padding(.trailing, 16).padding(.bottom, 15)
        }
    }
}

struct HomepageCategoriesCard_Previews: PreviewProvider {
    static var previews: some View {
        HomepageCategoriesCard().previewLayout(.sizeThatFits)
    }
}
