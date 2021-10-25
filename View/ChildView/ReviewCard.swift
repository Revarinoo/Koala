//
//  ReviewCard.swift
//  Koala
//
//  Created by Jonathan Clive on 25/10/21.
//

import SwiftUI
import SDWebImageSwiftUI
import Alamofire

struct ReviewCard: View {
    let photoURL: String
    let name: String
    let message: String
    let rating: Int?
    
    private func starType(index: Int) -> String {
        if let rating = self.rating {
            return index <= rating ? "star.fill" : "star"
        } else {
            return "star"
        }
    }
    
    var body: some View {
        HStack {
            VStack {
                WebImage(url: URL(string: photoURL))
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
                Text("\(name)")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 12))
                    .foregroundColor(Color.init(hex: "541605"))
            }
            .padding(.leading, 10)
            .frame(width: 80)
            VStack {
                HStack {
                    Text("\(message)")
                        .font(Font.custom(ThemeFont.poppinsRegular, size: 12))
                        .foregroundColor(.black)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                }
                .padding(.top, 10)
                .padding(.leading, 20)
                .padding(.bottom, 2)
                HStack {
                    Spacer()
                    ForEach(1...5, id: \.self) { index in
                        Image(systemName: self.starType(index: index))
                            .foregroundColor(.yellow)
                            .frame(width: 15.82, height: 14)
                    }
                }
                .padding(.bottom, 5)
                .padding(.trailing, 10)
            }
        }
        .padding(.top, 5)
        .padding(.bottom, 5)
        .frame(minWidth: 300, maxWidth: 356)
        
        .background(Color.init(hex: "FFFFFF"))
        .cornerRadius(10)
        .shadow(color: .gray, radius: 3, x: 1, y: 2)
    }
}

struct ReviewCard_Previews: PreviewProvider {
    static var previews: some View {
        ReviewCard(photoURL: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg", name: "Arief Lasso", message: "Creative Content and amazing result of brand awareness.", rating: 4).previewLayout(.sizeThatFits)
    }
}
