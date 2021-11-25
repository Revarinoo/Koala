//
//  LocationView.swift
//  Koala
//
//  Created by Clara Anggraini on 25/11/21.
//

import Foundation
import SwiftUI

struct LocationView: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack {
            Image(subtitle).frame(minWidth: 42, minHeight: 42)
            VStack(alignment: .leading) {
                Text(title).font(Font.system(size: 15, weight: .medium)).foregroundColor(ThemeColor.primary)
                Text(subtitle).font(Font.system(size: 13.5, weight: .regular)).foregroundColor(ThemeColor.grayDark)
                
            }
        }
        .padding(.top, 5)
        .padding(.bottom, 5)
        
        .background(Color.init(hex: "FFFFFF"))
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(title: "Jakarta Utara", subtitle: "Location").previewLayout(.sizeThatFits)
    }
}
