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
    @Binding var id: Int 
    @Binding var isPresent : Bool
    @State var isScrolling = false
    
    var body: some View {
        NavigationView{
            ZStack{
                ScrollView (.vertical, showsIndicators: false) {
                    ZStack(alignment: .top) {
                        VStack {
                            btnBack
                            
                            VStack {
                                CampaingUpcomingFieldView(campaign: campaignVM.campaignModel, campaignDetail: campaignVM.campaignDetailModel)
                            }
                            .frame(width: UIScreen.main.bounds.width - 28, alignment: .leading)
                                .padding(EdgeInsets(top: 60, leading: 28, bottom: 100, trailing: 0))
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
                .gesture(
                    DragGesture().onChanged { value in
                       if value.translation.height > 0 {
                          isScrolling = false
                       } else {
                          isScrolling = true
                       }
                    }
                 )
                VStack{
                    Rectangle().fill(ThemeColor.primary)
                        .frame(height: 88).padding(.top,0).ignoresSafeArea(.all)
                    Spacer()
                }
            }
            
            .onAppear {
                campaignVM.getUpcomingDetail(id: self.id)
                print(campaignVM.campaignDetailModel)
                print("id ye \(id)")
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    if isScrolling{
                        Button(action: {
                            self.isPresent = false
                        }){
                            HStack{
                                Image(systemName: "chevron.left")
                                Text("My Campaigns")
                            }
                            
                        }.foregroundColor(ThemeColor.primary)
                    } else {
                        Button(action: {
                            self.isPresent = false
                        }){
                            HStack{
                                Image(systemName: "chevron.left")
                                Text("My Campaigns")
                            }
                            
                        }.foregroundColor(.white)
                    }
                    
                }
            }
            .background(ThemeColor.primary.ignoresSafeArea())
            .frame(height: UIScreen.main.bounds.height + 40)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(false)
        }
        
    }
    
    var btnBack: some View {
        HStack{
//            Button(action:{
//                self.presentationMode.wrappedValue.dismiss()
//            }){
//                Image(systemName: "chevron.left")
//                    .resizable()
//                    .foregroundColor(.white)
//                    .scaledToFit()
//            }.frame(width: 24, height: 24, alignment: .center)
//
//            Spacer()

        }
        .padding(EdgeInsets(top: 80, leading: 24, bottom: 153, trailing: 0))
    }
}

//struct CampaignUpcomingView_Previews: PreviewProvider {
//    static var previews: some View {
//        CampaignUpcomingView(isPresent: .constant(true))
//    }
//}
