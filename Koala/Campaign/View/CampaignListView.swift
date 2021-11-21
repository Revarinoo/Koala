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
