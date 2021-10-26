//
//  FollowerProfile.swift
//  Koala
//
//  Created by Revarino Putra on 25/10/21.
//

import SwiftUI

struct FollowerProfile: View {
    
    @State var currentIndex: Int = 0
    @State var data: [FollowersData] = []
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Follower Profile")
                .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                .padding(.leading, 16)
                .padding(.bottom, 16)
            VStack (alignment: .center, spacing: 14) {
                ImageSlider(index: $currentIndex, items: data) { profile in
                    Image(profile.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                }
                HStack {
                    ForEach(data.indices, id:\.self) { index in
                        Circle()
                            .fill(currentIndex == index ? ThemeColor.primary: Color.init(hex: "C4C4C4"))
                            .frame(width: 10, height: 10)
                            .scaleEffect(currentIndex == index ? 1.4 : 1)
                            .animation(.spring(), value: currentIndex == index)
                    }
                }
            }
        }
        .onAppear {
            for _ in 1...5 {
                data.append(FollowersData(image: "offer"))
            }
        }
        
    }
}

struct FollowerProfile_Previews: PreviewProvider {
    static var previews: some View {
        FollowerProfile()
    }
}

struct FollowersData: Identifiable {
    var id = UUID().uuidString
    var image: String
}
