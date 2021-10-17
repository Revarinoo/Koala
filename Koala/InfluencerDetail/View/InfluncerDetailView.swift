//
//  InfluncerDetailView.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 17/10/21.
//

import SwiftUI

struct InfluncerDetailView: View {
    
    @ObservedObject var influencerDetailVM = InfluencerDetailViewModel()
    
    var body: some View {
        VStack {
            Text("username IG \(influencerDetailVM.influencerDetailModel.username)")
            Text("followers IG \(influencerDetailVM.influencerDetailModel.followers)")
            Text("engagement rate IG \(influencerDetailVM.influencerDetailModel.engagementRate) %")
        }
        .onAppear() {
            influencerDetailVM.callGetAccInfo(username: "asokaremadjas")
            influencerDetailVM.callGetFeedData(username: "asokaremadjas")
        }
    }
}

struct InfluncerDetailViewPreviews: PreviewProvider {
    static var previews: some View {
        InfluncerDetailView()
    }
}
