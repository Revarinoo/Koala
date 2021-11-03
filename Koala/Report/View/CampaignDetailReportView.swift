//
//  CampaignDetailReportView.swift
//  Koala
//
//  Created by Jonathan Clive on 29/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct CampaignDetailReportView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            ZStack(alignment: .top){
                VStack{
                    HStack{
                        Button(action:{
                            
                        }){
                            Image(systemName: "chevron.left")
                                .resizable()
                                .foregroundColor(.white)
                                .scaledToFit()
                        }.frame(width: 24, height: 24, alignment: .center)
                        
                        Spacer()
                        
                    }.padding(.horizontal, 16)
                        .padding(.top, 48)
                        .padding(.bottom, 140)
                    
                    VStack{
                        Text("Nama campaign").font(Font.custom(ThemeFont.poppinsSemiBold, size: 30))
                        
                        Text("Tanggal campaign").font(Font.custom(ThemeFont.poppinsMedium, size: 14)).padding(.bottom, 15)
                        Path() { path in
                            path.move(to: CGPoint(x: 0, y: 0))
                            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 0))
                        }
                        .stroke(Color.gray, lineWidth: 0.2)
                        .frame(height: 0.4)
                        
                        //isi bawah
                        VStack (alignment: .leading) {
                            Text("Result")
                                .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                                .foregroundColor(.black)
                            ResultExpenseCard(price: 1500000)
                            HStack (alignment: .center) {
                                ResultTypeCard(type: "Story", reachNum: "10.1K", impressionNum: "2.1K")
                                ResultTypeCard(type: "Post", reachNum: "10.1K", impressionNum: "2.1K")
                                ResultTypeCard(type: "Reels", reachNum: "10.1K", impressionNum: "2.1K")
                            }
                        }
                        VStack (alignment: .leading){
                            Text("Influencer List")
                                .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                                .foregroundColor(.black)
                            ResultInfluencerCard(photoURL: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg", name: "Asoka Remadjas", price: 1000000, likeNum: "11.6K", commentNum: "5.6K", erNum: "3.1%")
                        }
                            
                    }.frame(width: UIScreen.main.bounds.width, alignment: .top)
                        .ignoresSafeArea()
                        .padding(.top, 60)
                    .background(Color.white)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                    
                }
                
                VStack{
                    
                    WebImage(url: URL(string: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg"))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 127, height: 127)
                        .cornerRadius(20.0)
                        .overlay(RoundedRectangle(cornerRadius: 20.0)
                            .stroke(Color.white, lineWidth: 5))
                    
                }.padding(.top, 150)
        }
           
    }.navigationBarHidden(true)
            .background(ThemeColor.primary.ignoresSafeArea())
            .ignoresSafeArea()
        
    }
}

struct CampaignDetailReportView_Previews: PreviewProvider {
    static var previews: some View {
        CampaignDetailReportView()
    }
}
