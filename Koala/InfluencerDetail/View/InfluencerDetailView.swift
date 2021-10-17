//
//  InfluncerDetailView.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 17/10/21.
//

import SwiftUI

struct InfluencerDetailView: View {
    
    @ObservedObject var influencerDetailVM = InfluencerDetailViewModel()
    var username: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(username)
                .font(.title)
            Text("username IG \(influencerDetailVM.influencerDetailModel.username)")
            Text("followers IG \(influencerDetailVM.influencerDetailModel.followers)")
            Text("engagement rate IG \(influencerDetailVM.influencerDetailModel.engagementRate) %")
            Spacer()
        }
        .onAppear() {
            influencerDetailVM.callGetAccInfo(username: "asokaremadjas")
            influencerDetailVM.callGetFeedData(username: "asokaremadjas")
        }
    }
}
