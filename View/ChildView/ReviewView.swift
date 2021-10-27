//
//  Review.swift
//  Koala
//
//  Created by Jonathan Clive on 25/10/21.
//

import SwiftUI

struct ReviewView: View {
    let reviews = ReviewViewModel().reviews
    
    private func averageRating () -> String {
        var sumRating = 0.0
        for review in reviews {
            sumRating += Double(review.rating)
        }
        return String(sumRating/Double(reviews.count))
    }
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack (alignment: .center) {
                Text("Reviews")
                    .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                    .foregroundColor(.black)
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .frame(width: 16, height: 14)
                Text("\(averageRating())/5")
                    .font(Font.custom(ThemeFont.poppinsMedium, size: 12))
                    .foregroundColor(Color.init(hex: "A7A7A7"))
                    .padding(.top, 5)
                    .padding(.leading, -5)
            }
            
            ScrollView(){
                VStack(spacing:12){
                    ForEach(reviews){ i in
                        ReviewCard(photoURL: i.userImage, name: i.name, message: i.message, rating: i.rating)
                    }
                }
            }
        }
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView().previewLayout(.sizeThatFits)
    }
}
