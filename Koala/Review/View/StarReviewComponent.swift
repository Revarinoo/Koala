//
//  StarReviewComponent.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 29/10/21.
//

import SwiftUI

struct StarReviewComponent: View {
    
    @Binding var rating: Int
    
    var maximumRating = 5
    var offImage = Image(systemName: "star")
    var onImage = Image(systemName: "star.fill")
    
    var body: some View {
        HStack {
            ForEach(1..<maximumRating + 1) { number in
                self.image(for: number)
                    .font(Font.system(size: 36))
                    .foregroundColor(ThemeColor.primary)
                    .onTapGesture {
                        self.rating = number
                    }
            }
        }
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}
