//
//  Review.swift
//  Koala
//
//  Created by Jonathan Clive on 25/10/21.
//

import SwiftUI

struct ReviewView: View {
    var projects: [ProjectModel] = []
    
    private func averageRating () -> String {
        var sumRating = 0.0
        for project in projects{
            sumRating += Double(project.rating)
        }
        sumRating /= Double(projects.count)
        return sumRating.oneDecimalFormatter
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
            
                VStack(spacing:12){
                    ForEach(projects){ project in
                        ReviewCard(photoURL: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg", name: project.businessOwner_name, message: project.comment, rating: Int(project.rating))
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