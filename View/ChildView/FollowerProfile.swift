//
//  FollowerProfile.swift
//  Koala
//
//  Created by Revarino Putra on 25/10/21.
//

import SwiftUI

struct FollowerProfile: View {
    
    @State var currentIndex: Int = 0
    var images: [AnalyticPhotoModel] = []
    
    var body: some View {
        VStack (alignment: .leading) {
            if images.isEmpty {
                Text("Follower Profile")
                    .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                    .padding(.bottom, 16)
                Text("Follower profile not set yet")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 12))
                    .foregroundColor(.black)
                    .frame(minWidth: 300, maxWidth: 356)
                    .padding(.top, 10)
            } else {
                Text("Follower Profile")
                    .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                    .padding(.leading, 16)
                    .padding(.bottom, 16)
                VStack (alignment: .center, spacing: 14) {
                    ImageSlider(index: $currentIndex, images: images)
                    HStack {
                        ForEach(images.indices, id:\.self) { index in
                            Circle()
                                .fill(currentIndex == index ? ThemeColor.primary: Color.init(hex: "C4C4C4"))
                                .frame(width: 10, height: 10)
                                .scaleEffect(currentIndex == index ? 1.2 : 1)
                                .animation(.spring(), value: currentIndex == index)
                        }
                    }
                }
            }
        }
        
    }
}

struct FollowerProfile_Previews: PreviewProvider {
    static var previews: some View {
        FollowerProfile()
    }
}
