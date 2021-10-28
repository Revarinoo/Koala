//
//  CampaignListView.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 27/10/21.
//

import SwiftUI

struct CampaignListView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var campaignListVM = CampaignListViewModel()
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.bgColorView.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .font(Font.custom(ThemeFont.poppinsMedium, size: 20))
                            .foregroundColor(ThemeColor.primary)
                            .cornerRadius(10)
                    })
                    Spacer()
                    Text("Campaign List")
                        .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                        .padding(.trailing)
                    Spacer()
                }
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 14, trailing: 0))
                
                ScrollView {
                    VStack(spacing: 16) {
//                        ForEach(campaignListVM.campaignLists) { campaign in
//                            NavigationLink(destination: LoginView()) {
//                                CampaignOrderCard(photoURL: campaign.campaignPhoto, name: campaign.campaignName, date: campaign.campaignDate)
//                                    .padding(.horizontal)
//                            }
//                        }
                    }
                }
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .accentColor(.white)
        .navigationBarHidden(true)
    }
}

struct CampaignListView_Previews: PreviewProvider {
    static var previews: some View {
        CampaignListView()
    }
}
