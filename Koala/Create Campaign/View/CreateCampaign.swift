//
//  CreateCampaign.swift
//  Koala
//
//  Created by Sholihatul Richas on 02/11/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct CreateCampaign: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            ZStack(alignment: .top){
                VStack{
                    HStack{
                        Button(action:{
                            self.presentationMode.wrappedValue.dismiss()
                        }){
                            Image(systemName: "chevron.left")
                                .resizable()
                                .foregroundColor(.white)
                                .scaledToFit()
                        }.frame(width: 24, height: 24, alignment: .center)
                        Spacer()
                        Text("Create Campaign").font(Font.custom(ThemeFont.poppinsSemiBold, size: 18)).foregroundColor(.white).frame(alignment: .center)
                        Spacer()
                    }.padding(.horizontal, 16)
                        .padding(.top, 48)
                        .padding(.bottom, 140)
                    
                    VStack{
                        
                        CreateCampaignForm()
                        Spacer()
                        
                    }.frame(width: UIScreen.main.bounds.width, alignment: .top)
                        .ignoresSafeArea()
                        .padding(.top, 110)
                        .background(Color.white)
                        .cornerRadius(20, corners: [.topLeft, .topRight])
                    
                }
                
                VStack{
                    
                    //WebImage(url: URL(string: "https://assets.teenvogue.com/photos/5fd4d29fe6ff71e902f97c1a/4:3/w_2443,h_1832,c_limit/taylor-evermore-resized.jpg"))
                    Image(systemName: "photo").font(.system(size: 36)).foregroundColor(.gray)
                        //.resizable()
                        .scaledToFill()
                        .frame(width: 127, height: 127)
                        .background(ThemeColor.background)
                        .cornerRadius(20.0)
                        .overlay(RoundedRectangle(cornerRadius: 20.0)
                                    .stroke(Color.white, lineWidth: 5))
                    Text("Add Photo").font(Font.custom(ThemeFont.poppinsRegular, size: 14)).foregroundColor(.gray)
                }.padding(.top, 150)
            }
            
        }.navigationBarHidden(true)
        //.onAppear(perform: {
        //    influencerDetailViewModel.callGetInfluencerDetail(influencer_id: influencerID)
        //})
            .background(ThemeColor.primary.ignoresSafeArea())
            .ignoresSafeArea()
    }}

struct CreateCampaign_Previews: PreviewProvider {
    static var previews: some View {
        CreateCampaign()
    }
}
