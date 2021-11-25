//
//  InfluencerDetailView.swift
//  Koala
//
//  Created by Clara Anggraini on 25/10/21.
//

import SwiftUI
import SDWebImageSwiftUI
import Introspect

struct InfluencerDetailView: View {
    @Binding var influencerDetailViewModel : InfluencerDetailViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var campaignList = CampaignViewModel.shared
    @State var isFavorite: Bool = false
    @State var categories: [String] = []
    @Binding var isPresent : Bool
    var previousView : String
    @Binding var influencerID: Int
    var fromBackButton : Bool
    
//    init(influencerID: Int, fromBackButton: Bool) {
//        UIScrollView.appearance().bounces = false
//        self.influencerID = influencerID
//        self.fromBackButton = fromBackButton
//    }
    
    var body: some View {
       NavigationView{
           ZStack{
               ScrollView(.vertical, showsIndicators: false){
                   ZStack(alignment: .top){
                       VStack{
                           WebImage(url: URL(string: influencerDetailViewModel.influencerModel?.influencer_profile.photo ?? ""))
                               .resizable()
                               .aspectRatio(contentMode: .fill)
                       }.frame(width: 390,height: 390)
                       VStack{
                           HStack{
                           }.padding(.horizontal, 16)
                               .padding(.vertical, 161)
                           
                           VStack(alignment: .leading){
                               
                               HStack{
                                   LocationView(title: influencerDetailViewModel.influencerModel?.influencer_profile.location ?? "", subtitle: "Location").padding(.trailing, 54)
                                   LocationView(title: String(influencerDetailViewModel.influencerModel?.influencer_profile.rating ?? 0), subtitle: "Rating")
                               }.padding(.horizontal,16)
                               Divider()
                               SpecialtyView(categories: influencerDetailViewModel.influencerModel?.categories ?? [])
                               
                               
                              
//                               Path() { path in
//                                   path.move(to: CGPoint(x: 0, y: 0))
//                                   path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 0))
//                               }
//                               .stroke(Color.gray, lineWidth: 0.2)
//                               .frame(height: 0.4)
                               
                               Group {
                                   SocialMedia(influencer: influencerDetailViewModel.influencerModel).padding()
//                                   FollowerProfile(images: influencerDetailViewModel.influencerModel?.analytic_photos ?? []).padding([.top, .bottom], 16)
                                   
                                   EstimatedPrice(products: influencerDetailViewModel.influencerModel?.products ?? []).padding([.top, .bottom], 16)
                                   
//                                   PreviousProjectView(projects: influencerDetailViewModel.influencerModel?.projects ?? [])
                                       .padding(.top, 16)
                                   
//                                   ReviewView(projects: influencerDetailViewModel.influencerModel?.projects ?? []).padding()
                                       .padding(.bottom, 86)
                               }
                           }.frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
                               .ignoresSafeArea()
                               .padding(.top, 20)
                               .background(Color.white)
                               .cornerRadius(20, corners: [.topLeft, .topRight])
                       }
                   }
               }
//               VStack{
//                   Rectangle().fill(ThemeColor.primary)
//                       .frame(height: 88)//.padding(.top,)
//                   Spacer()
//               }
           }
            
            
            .background(ThemeColor.primary.ignoresSafeArea())
            .ignoresSafeArea()
            .onAppear(perform: {
                print("CAlling influencer detrail")
                influencerDetailViewModel.callGetInfluencerDetail(influencer_id: influencerID)
                campaignList.callGetCampaigns()
                    //UINavigationBarAppearance().backgroundColor = UIColor(ThemeColor.primary)
            })
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(false).accentColor(.white)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        self.isPresent = false
                    }){
                        HStack{
                            Image(systemName: "chevron.left")
                            Text(previousView)
                        }
                        
                    }.foregroundColor(.white)
                }
            }

        }
    }
}

//struct InfluencerDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        //InfluencerDetailView(influencerDetailViewModel: <#Binding<InfluencerDetailViewModel>#>, isPresent: .constant(true), previousView: "Influencer List", influencerID: 1, fromBackButton: true)
//    }
//}

struct OrderButton: View {
    var body: some View{
        Text("Order").font(Font.custom(ThemeFont.poppinsBold, size: 18))
            .foregroundColor(Color.white)
            .frame(width: 300, height: 50, alignment: .center)
            .background(ThemeColor.primary)
            .cornerRadius(15)
            .shadow(radius: 4)
    }
}

////Order button
//HStack{
//    NavigationLink(destination: campaignList.campaignModel.count == 0 ? AnyView(CreateCampaign(isPresent: .constant(true)).navigationBarHidden(true)) : AnyView(CampaignListView(influencerID: influencerDetailViewModel.influencerModel?.influencer_profile.id ?? 0))){
//        OrderButton()
//    }
//
//
//}.padding(.bottom, 8)
