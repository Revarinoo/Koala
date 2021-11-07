//
//  CampaignUpcomingView.swift
//  Koala
//
//  Created by Revarino Putra on 03/11/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct CampaignUpcomingView: View {
    @StateObject var campaignVM = CampaignUpcomingViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var id: Int = 1
    
    var body: some View {
        ScrollView (.vertical, showsIndicators: false) {
            ZStack(alignment: .top) {
                VStack {
                    btnBack
                    
                    VStack {
                        CampaingUpcomingFieldView(campaign: campaignVM.campaignModel, campaignDetail: campaignVM.campaignDetailModel)
                    }
                    .frame(width: UIScreen.main.bounds.width - 28, alignment: .leading)
                        .padding(EdgeInsets(top: 60, leading: 28, bottom: 60, trailing: 0))
                    .background(Color.white)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                }
                
                VStack{
                    
                    WebImage(url: URL(string: campaignVM.campaignModel.campaign_logo))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 127, height: 127)
                        .cornerRadius(20.0)
                        .overlay(RoundedRectangle(cornerRadius: 20.0)
                            .stroke(Color.white, lineWidth: 5))
                    
                }.padding(.top, 157)
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            campaignVM.getUpcomingDetail(id: self.id)
        }
        .background(ThemeColor.primary.ignoresSafeArea())
        .frame(height: UIScreen.main.bounds.height)
        
    }
    
    var btnBack: some View {
        HStack{
            Button(action:{
                self.presentationMode.wrappedValue.dismiss()
            }){
                Image(systemName: "chevron.left")
                    .resizable()
                    .foregroundColor(.white)
                    .scaledToFit()
            }.frame(width: 16, height: 16, alignment: .center)

            Spacer()

        }
        .padding(EdgeInsets(top: 60, leading: 24, bottom: 153, trailing: 0))
    }
}

struct CampaignUpcomingView_Previews: PreviewProvider {
    static var previews: some View {
        CampaignUpcomingView()
    }
}
