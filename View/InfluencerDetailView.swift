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
                           
                           VStack(alignment: .leading, spacing: 16){
                               
                               HStack{
                                   LocationView(title: influencerDetailViewModel.influencerModel?.influencer_profile.location ?? "", subtitle: "Location").padding(.trailing, 54)
                                   LocationView(title: String(influencerDetailViewModel.influencerModel?.influencer_profile.rating ?? 0), subtitle: "Rating")
                               }.padding(.horizontal,20)
                                .padding(.bottom, 20)
                               
                               Divider()
                               
                               FollowerProfile(projects: influencerDetailViewModel.influencerModel?.projects ?? [])
                               
                               ReviewView(projects: influencerDetailViewModel.influencerModel?.projects ?? [])

                                   .padding(.leading, 16)
                              
                               SpecialtyView(categories: influencerDetailViewModel.influencerModel?.categories ?? [])
                                   .padding(.horizontal, 16)
                               
                               Group {
                                   SocialMedia(influencer: influencerDetailViewModel.influencerModel).padding()
                                   
                                   EstimatedPrice(products: influencerDetailViewModel.influencerModel?.products ?? [])
                                       .padding(.horizontal, 16)
                                   Spacer(minLength: 120)
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
               VStack{
                   Spacer()
                   HStack{
                       Text(influencerDetailViewModel.influencerModel?.influencer_profile.name ?? "")
                           .font(Font.custom(ThemeFont.poppinsMedium, size: 16))
                           .foregroundColor(.black)
                           .padding(.trailing, 51)
                       ChatButton()
                           .padding(.trailing, 10)
                       NavigationLink(destination: campaignList.campaignModel.count == 0 ? AnyView(CreateCampaign(isPresent: .constant(true)).navigationBarHidden(true)) : AnyView(CampaignListView(influencerID: influencerDetailViewModel.influencerModel?.influencer_profile.id ?? 0))){
                           
                           OrderButton()
                                
                        }
                        
                   }.padding(.vertical)
//                       .padding(.horizontal, 30)
                   .frame(minWidth: 390, minHeight: 93)
                       .background(ThemeColor.grayLight)
                   
               }
           }
            
            
            .background(ThemeColor.primary.ignoresSafeArea())
            .ignoresSafeArea()
            .onAppear(perform: {
//                influencerDetailViewModel.callGetInfluencerDetail(influencer_id: influencerID)
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
        Text("Order")
            .font(Font.system(size: 15, weight: .semibold))
            .foregroundColor(Color.white)
            .frame(width: 93, height: 33, alignment: .center)
            .background(ThemeColor.primary)
            .cornerRadius(10)
    }
}

struct ChatButton: View {
    var body: some View{
        Text("Chat")
            .font(Font.system(size: 15, weight: .semibold))
            .foregroundColor(ThemeColor.primary)
            .frame(width: 93, height: 33, alignment: .center)
            .background(Color.clear)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(ThemeColor.primary, lineWidth: 1)
            )
    }
}
