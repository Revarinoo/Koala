//
//  OrderReviewView.swift
//  Koala
//
//  Created by Jonathan Clive on 25/11/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct OrderReviewView: View {
    let photoURL: String
    let name: String
    let comment: String
    let rating: Int?
    
    private func starType(index: Int) -> String {
        if let rating = self.rating {
            return index <= rating ? "star.fill" : "star"
        } else {
            return "star"
        }
    }
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                WebImage(url: URL(string: photoURL))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 78, height: 78)
                    .cornerRadius(20)
                VStack (alignment: .leading) {
                    Text(name)
                        .font(Font.custom(ThemeFont.poppinsSemiBold, size: 20))
                        .padding(.bottom, -8)
                    HStack{
                        ForEach(1...5, id: \.self) { index in
                            Image(systemName: self.starType(index: index))
                                .foregroundColor(.orange1)
                                .frame(width: 31, height: 29)
                                .padding(.leading, -7)
                        }
                    }
                }
                .padding(.leading, 5)
                Spacer()
            }
            Text("Comment")
                .font(Font.custom(ThemeFont.poppinsSemiBold, size: 16))
                .padding(.top)
            ZStack (alignment: .topLeading){
                Rectangle()
                    .frame(width: 358, height: 178)
                    .cornerRadius(10)
                    .foregroundColor(Color.init(hex: "F3F4F8"))
                    .shadow(color: Color.init(hex: "BFBFBF"), radius: 3, x: 1, y: 2)
                Text(comment)
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .padding()
            }
            .padding(.top, -10)
            Spacer()
        }
        .padding()
        .background(Color.bgColorView.ignoresSafeArea())
        .navigationTitle("Review")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct OrderReviewView_Previews: PreviewProvider {
    static var previews: some View {
        OrderReviewView(photoURL: "https://imgv3.fotor.com/images/homepage-feature-card/Fotor-AI-photo-enhancement-tool.jpg", name: "Kopi Janji Jiwa", comment: "Thank you! Satisfied with the work and worth the price. Would love to reccomend you to my other friends who also got coffee shops. ", rating: 4)
    }
}
