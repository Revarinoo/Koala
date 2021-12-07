//
//  CompletedCard.swift
//  Koala
//
//  Created by Sholihatul Richas on 26/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct CompletedCard: View {
    let type: String
    let name: String
    let data1: String
    let data2: String
    let engagement: String
    let photo: String
    let orderId: Int
    @State var showReview = false
    
    var body: some View {
        VStack{
            HStack {
                Image("ig")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 25, height: 25)
                Text(type).font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                Spacer()
                Text("12.12 Campaign")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 12))
                    .foregroundColor(Color.init(hex: "A7A7A7"))
            }
            .padding(.horizontal, 15)
            .padding(.bottom, -10)
            .padding(.vertical, 10)
            .padding(.trailing, 2)
            Divider()
            HStack(spacing: 18){
                WebImage(url: URL(string: photo))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 82, height: 88)
                    .cornerRadius(10)
                VStack (alignment: .leading, spacing: 6){
                    Text(name).font(Font.custom(ThemeFont.poppinsMedium, size: 18))
                    HStack{
                        VStack{
                            Text(data1).font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                            if type == "Story" {
                                Text("Reach").font(Font.custom(ThemeFont.poppinsRegular, size: 12)).foregroundColor(ThemeColor.primary)
                            } else if type == "Post" {
                                Text("Likes").font(Font.custom(ThemeFont.poppinsRegular, size: 12)).foregroundColor(ThemeColor.primary)
                            } else if type == "Reels" {
                                Text("Views").font(Font.custom(ThemeFont.poppinsRegular, size: 12)).foregroundColor(ThemeColor.primary)
                            }
                        }
                        Spacer()
                        VStack{
                            Text(data2).font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                            if type == "Story" {
                                Text("Impression").font(Font.custom(ThemeFont.poppinsRegular, size: 12)).foregroundColor(ThemeColor.primary)
                            } else if type == "Post" {
                                Text("Comments").font(Font.custom(ThemeFont.poppinsRegular, size: 12)).foregroundColor(ThemeColor.primary)
                            } else if type == "Reels" {
                                Text("Likes").font(Font.custom(ThemeFont.poppinsRegular, size: 12)).foregroundColor(ThemeColor.primary)
                            }
                        }
                        Spacer()
                        VStack{
                            Text(engagement).font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                            Text("Engagement").font(Font.custom(ThemeFont.poppinsRegular, size: 12)).foregroundColor(ThemeColor.primary)
                        }
                        //Spacer()
                    }
                }
                Spacer()
            }.padding(.top, 16).padding(.leading, 16).padding(.top, -5)
            HStack{
                Spacer()
                Button(action:{
                    showReview = true
                }){
                    Text("Review").font(Font.custom(ThemeFont.poppinsMedium, size: 12))
                        .foregroundColor(.white)
                        .padding()
                        .padding([.leading, .trailing])
                        .frame(height: 38)
                    .background(ThemeColor.primary)
                    .cornerRadius(10)
                }
            }.padding(.bottom, 9).padding(.trailing, 16)
            
                .fullScreenCover(isPresented: $showReview){
                    ReviewInfluencerView(photoURL: photo, name: name, orderId: orderId, isPresent: $showReview)
                }
        }
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct CompletedCard_Previews: PreviewProvider {
    static var previews: some View {
        CompletedCard(type: "Story", name: "Felix Lee", data1: "21.5K", data2: "10.8K", engagement: "10.1%", photo: "", orderId: 1).previewLayout(.sizeThatFits)
    }
}
