//
//  LocationFilter.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 21/10/21.
//

import SwiftUI

struct LocationFilter: View {
    var body: some View {
        HStack {
            Text("Location")
                .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                .foregroundColor(.black)
            Spacer()
            Button(action: {
                print("location tapped")
            }, label: {
                HStack {
                    Text("Jakarta")
                        .font(Font.custom(ThemeFont.poppinsMedium, size: 16))
                        .foregroundColor(.black)
                    Image(systemName: "chevron.right")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .font(Font.title.weight(.bold))
                        .frame(width: 6)
                        .foregroundColor(ThemeColor.primary)
                }
            })
        }
        .padding(.horizontal, 18)
    }
}

struct LocationFilter_Previews: PreviewProvider {
    static var previews: some View {
        LocationFilter()
            .previewLayout(.sizeThatFits)
    }
}
