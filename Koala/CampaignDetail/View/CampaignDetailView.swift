//
//  CampaignDetailView.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 02/11/21.
//

import SwiftUI

struct CampaignDetailView: View {
    
    //@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var campaignDetailVM = CampaignDetailViewModel()
    
    var campaignTitle: String
    var contentID: Int
    
    var body: some View {
            ZStack(alignment: .topLeading) {
                Color.bgColorView.edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading) {
                    Text("Tasks")
                        .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                        .padding(.leading, 16)
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 16) {
                            ForEach(campaignDetailVM.campaignTasks) { task in
                                CampaignTaskCard(productName: task.contentType, instructions: task.instruction)
                                    .padding(.horizontal)
                            }
                        }
                    }
                }
            }
            
            .navigationBarTitle(campaignTitle, displayMode: .inline)
            .navigationBarHidden(false)
            .onAppear() {
                campaignDetailVM.callGetCampaignDetail(contentID)
            }
    }
}

struct CampaignDetail_Previews: PreviewProvider {
    static var previews: some View {
        CampaignDetailView(campaignTitle: "Title Campaign", contentID: 1)
    }
}
