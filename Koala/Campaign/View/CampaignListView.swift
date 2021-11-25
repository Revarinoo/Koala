//
//  CampaignListView.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 27/10/21.
//

import SwiftUI
import Introspect

struct CampaignListView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var campaignListVM = CampaignViewModel()
    @State var uiTabarController: UITabBarController?
    
    let influencerID: Int
    
    init(influencerID : Int){
        self.influencerID = influencerID
//        UINavigationBarAppearance().backgroundColor = UIColor(ThemeColor.background)
//        UINavigationBarAppearance().shadowColor = .clear
//        UINavigationBar.appearance().tintColor = UIColor(ThemeColor.primary)
//        UINavigationBarAppearance().titleTextAttributes = [.foregroundColor: UIColor(ThemeColor.primary)]
//        UINavigationBarAppearance().largeTitleTextAttributes = [.foregroundColor: UIColor(ThemeColor.primary)]
        UINavigationBar.appearance().barTintColor = .clear
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)

        
    }
    
    var body: some View {
        //NavigationView{
            ZStack(alignment: .topLeading) {
                Color.bgColorView.edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading) {
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(campaignListVM.campaignModel) { campaign in
                                CampaignOrderCard(influencerID: influencerID, contentID: campaign.content_id, photoURL: campaign.photo, productTypes: campaign.type, name: campaign.name, date: campaign.schedule)
                                    .padding(.horizontal)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Campaign List", displayMode: .inline)
            .navigationBarHidden(false)
//            .toolbar {
//                Button(action: {
//                    self.presentationMode.wrappedValue.dismiss()
//                    //print("add new")
//                }, label: {
//                    Image(systemName: "chevron.left")
//                        .foregroundColor(ThemeColor.primary)
//                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 16))
//                })
//            }
            //.navigationBarColor(backgroundColor: UIColor(ThemeColor.background), titleColor: .black, tintColor: UIColor(ThemeColor.primary))
            .onAppear() {
                campaignListVM.callGetCampaigns()
            }
        //}
        
    }
}

struct CampaignListView_Previews: PreviewProvider {
    static var previews: some View {
        CampaignListView(influencerID: 1)
    }
}
