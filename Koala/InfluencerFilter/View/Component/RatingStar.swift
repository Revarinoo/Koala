//
//  RatingStar.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 21/10/21.
//

import SwiftUI

struct RatingStar: View {
    
    @Binding var rating: Int

    var maximumRating = 5

    var offImage = Image(systemName: "star")
    var onImage = Image(systemName: "star.fill")
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Rating")
                    .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                    .foregroundColor(.black)
                Text("(minimal)")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(ThemeColor.gray)
            }
            HStack {
                ForEach(1..<maximumRating + 1) { number in
                    self.image(for: number)
                        .font(Font.system(size: 30))
                        .foregroundColor(ThemeColor.primary)
                        .onTapGesture {
                            self.rating = number
                        }
                }
            }
        }
        .padding(.horizontal)
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

struct RatingStar_Previews: PreviewProvider {
    static var previews: some View {
        RatingStar(rating: .constant(4)).previewLayout(.sizeThatFits)
    }
}
