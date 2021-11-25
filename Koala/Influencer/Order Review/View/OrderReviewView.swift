//
//  OrderReviewView.swift
//  Koala
//
//  Created by Jonathan Clive on 25/11/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct OrderReviewView: View {
    var orderId: Int
    
    @StateObject var orderReviewVM = OrderReviewViewModel()
    
    private func starType(index: Int) -> String {
        return index <= orderReviewVM.data.review.rating ? "star.fill" : "star"
    }
    
    var body: some View {
        
        if orderReviewVM.isReviewed {
            VStack (alignment: .leading) {
                HStack {
                    WebImage(url: URL(string: orderReviewVM.data.business.photo))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 78, height: 78)
                        .cornerRadius(20)
                    VStack (alignment: .leading) {
                        Text(orderReviewVM.data.business.name)
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
                    Text(orderReviewVM.data.review.comment)
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
            .onAppear {
                orderReviewVM.getReview(orderId: orderId)
            }
        }
        else {
            Text("This Order Haven't Reviewed Yet")
                .foregroundColor(ThemeColor.primary)
                .font(.custom(ThemeFont.poppinsSemiBold, size: 18))
        }
    }
}

struct OrderReviewView_Previews: PreviewProvider {
    static var previews: some View {
        OrderReviewView(orderId: 1)
    }
}
