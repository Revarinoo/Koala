//
//  LocationFilter.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 21/10/21.
//

import SwiftUI

struct LocationFilter: View {
    
    @Binding var location: [String]
        
    var body: some View {
        HStack {
            Text("Location")
                .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                .foregroundColor(.black)
            Spacer()
            NavigationLink(
                destination: LocationSelection(location: $location),
                label: {
                    HStack {
                        Text(location.first ?? "")
                            .font(Font.custom(ThemeFont.poppinsMedium, size: 16))
                            .foregroundColor(.black)
                        Image(systemName: "chevron.right")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .font(Font.title.weight(.bold))
                            .frame(width: 6)
                            .foregroundColor(ThemeColor.primary)
                    }
                }
            )
        }
        .padding(.horizontal)
    }
}
