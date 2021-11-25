//
//  SpecialtyView.swift
//  Koala
//
//  Created by Clara Anggraini on 25/11/21.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct SpecialtyView: View {
    let categories: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Specialty").font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
            HStack(spacing: 14) {
                
                ForEach(categories ?? [], id: \.self) { category in
                    
                    Text(category).scaledToFill()
                        .frame(width:110)
                        .font(Font.custom(ThemeFont.poppinsSemiBold, size: 14))
                        .padding(.vertical, 10)
                        .foregroundColor(ThemeColor.primary)
                        .background(Color(hex: "FFF1ED"))
                        .cornerRadius(10)
                }
                
            }.padding(.bottom, 16)
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 16)
        .frame(minWidth: 300, maxWidth: 356)
        
        .background(Color.init(hex: "FFFFFF"))
    }
}

struct SpecialtyView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialtyView(categories: ["Coffee", "Healthy"]).previewLayout(.sizeThatFits)
    }
}
