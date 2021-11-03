//
//  InfluencerDetailView.swift
//  Koala
//
//  Created by Clara Anggraini on 25/10/21.
//

import SwiftUI
import SDWebImageSwiftUI
import MessageUI

struct InfluencerDetailView: View {
    @StateObject var influencerDetailViewModel = InfluencerDetailViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var isFavorite: Bool = false
    @State var categories: [String] = []
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    @State var photoURL = "https://assets.teenvogue.com/photos/5fd4d29fe6ff71e902f97c1a/4:3/w_2443,h_1832,c_limit/taylor-evermore-resized.jpg"
    var influencerID: Int
    
    init(influencerID: Int) {
        UIScrollView.appearance().bounces = false
        self.influencerID = influencerID
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
                        
                        Button(action:{
                            self.isFavorite.toggle()
                        }){
                            Image(systemName: self.isFavorite == true ? "heart.fill" : "heart")
                                .resizable()
                                .foregroundColor(.white)
                                .scaledToFit()
                            
                        }.frame(width: 24, height: 24, alignment: .center)
                    }.padding(.horizontal, 16)
                        .padding(.top, 48)
                        .padding(.bottom, 140)
                    
                    VStack{
                        
                        HStack{
                            
                            Text(influencerDetailViewModel.influencerModel?.influencer_profile.name ?? "").font(Font.custom(ThemeFont.poppinsSemiBold, size: 30))
                            Image(systemName: "checkmark.seal.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 25, height: 25, alignment: .center)
                                .foregroundColor(Color.orange1)
                            
                        }
                        
                        Text(influencerDetailViewModel.influencerModel?.influencer_profile.location ?? "Jakarta Utara").font(Font.custom(ThemeFont.poppinsMedium, size: 14)).padding(.bottom, 15)
                       
                        Text("Specialty").font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                        
                        HStack(spacing: 14) {
                            
                            ForEach(influencerDetailViewModel.influencerModel?.categories ?? [], id: \.self) { category in
                                
                                Text(category).scaledToFill()
                                    .frame(width:110)
                                    .font(Font.custom(ThemeFont.poppinsMedium, size: 14))
                                    .padding(.vertical, 10)
                                    .foregroundColor(ThemeColor.primary)
                                    .background(ThemeColor.primaryLight)
                                    .cornerRadius(10)
                            }
                            
                        }.padding(.bottom, 16)
                        
                        HStack{
                            
                            NavigationLink(destination: CampaignListView(influencerID: influencerDetailViewModel.influencerModel?.influencer_profile.id ?? 0)) {
                                Text("Order").font(Font.custom(ThemeFont.poppinsBold, size: 18))
                                    .foregroundColor(Color.white)
                                    .frame(width: 300, height: 50, alignment: .center)
                                        .background(ThemeColor.primary)
                                        .cornerRadius(15)
                                        .shadow(radius: 4)

                            }
                            
                            Button(action:{
                                self.isShowingMailView.toggle()
                                print("Tap")
                            }){
                                Image(uiImage: UIImage(named: "Message")!)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .padding(.top, 8)
                                
                            }
                            
                        }.padding(.bottom, 8)
                        
                        Path() { path in
                            path.move(to: CGPoint(x: 0, y: 0))
                            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 0))
                        }
                        .stroke(Color.gray, lineWidth: 0.2)
                        .frame(height: 0.4)
                        
                        SocialMedia(influencer: influencerDetailViewModel.influencerModel).padding()
                        FollowerProfile().padding([.top, .bottom], 16)
                        
                        PreviousProjectView(projects: influencerDetailViewModel.influencerModel?.projects)
                        
                        ReviewView(projects: influencerDetailViewModel.influencerModel?.projects ?? []).padding()
                            .padding(.bottom, 86)
                            
                    }.frame(width: UIScreen.main.bounds.width, alignment: .top)
                        .ignoresSafeArea()
                        .padding(.top, 60)
                    .background(Color.white)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                    
                }
                
                VStack{
                    
                    WebImage(url: URL(string: influencerDetailViewModel.influencerModel?.influencer_profile.photo ?? ""))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 127, height: 127)
                        .cornerRadius(20.0)
                        .overlay(RoundedRectangle(cornerRadius: 20.0)
                            .stroke(Color.white, lineWidth: 5))
                    
                }.padding(.top, 150)
                    .disabled(!MFMailComposeViewController.canSendMail())
                        .sheet(isPresented: $isShowingMailView) {
                            MailView(isShowing: $isShowingMailView, result: self.$result, toRecipient: influencerDetailViewModel.influencerModel?.influencer_profile.contact_email ?? "")
                        }
        }
           
    }.navigationBarHidden(true)
            .onAppear(perform: {
                influencerDetailViewModel.callGetInfluencerDetail(influencer_id: influencerID)
            })
            .background(ThemeColor.primary.ignoresSafeArea())
            .ignoresSafeArea()
}


            
}

struct InfluencerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        InfluencerDetailView(influencerID: 1)
    }
}

